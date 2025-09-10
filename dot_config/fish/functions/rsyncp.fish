function rsyncp -d "rsync shortcut with progress and summary before starting, supports -y, -q, and dry run interruption fallback"

    # --- Flag Parsing ---
    set -l auto_confirm false
    set -l quick_mode false
    set -l filtered_argv # To store non-flag arguments (source and destination)

    for arg in $argv
        switch "$arg"
            case '-y' '--yes'
                set auto_confirm true
            case '-q' '--quick'
                set quick_mode true
            case '*'
                # Add non-flag arguments to filtered_argv
                set filtered_argv "$filtered_argv" "$arg"
        end
    end

    # Use filtered_argv for source and destination
    if test (count $filtered_argv) -ne 2
        echo "Usage: rsyncp [-y | --yes] [-q | --quick] <source> <destination>"
        echo "  -y, --yes: Auto-accept transfer without prompt."
        echo "  -q, --quick: Skip dry run and prompt, proceed directly."
        echo "Example: rsyncp /path/to/source/ /path/to/destination/"
        return 1
    end

    set -l source $filtered_argv[1]
    set -l destination $filtered_argv[2]

    # --- Argument Validation and Formatting ---
    if test -d "$source"
        if not string match -q '*/' "$source"
            set source "$source/"
        end
    end
    # Check if destination is a directory before appending '/', unless quick mode is enabled
    # In quick mode, we might not have a dry run to tell us if it's a dir,
    # but rsync handles file destinations correctly without a trailing slash.
    # However, for consistency and safety with the folder-by-folder fallback,
    # let's assume if the destination path exists and is a directory, it should end in '/'.
    # If it doesn't exist, rsync will create the final component as a directory anyway if the source ends in '/'.
    if test -d "$destination"
        if not string match -q '*/' "$destination"
            set destination "$destination/"
        end
    end


    # --- Check rsync availability ---
    if not type -q rsync
        echo "Error: 'rsync' command not found. Please install it and try again."
        return 1
    end

    # --- Main Logic Flow ---

    set -l dry_run_status 0 # Default to successful if dry run is skipped

    if not $quick_mode
        echo "--- Rsync Dry Run (Files to be affected) ---"
        echo "Press Ctrl+C during the dry run to skip estimation and proceed with folder-by-folder sync."

        # Run dry run and capture status, pipe output to stderr
        # We don't need to capture the output into a variable here, tee handles display.
        rsync -av --stats --dry-run "$source" "$destination" 2>&1 | tee /dev/stderr
        set dry_run_status $status

        # --- Handle Dry Run Outcome ---
        if test $dry_run_status -eq 130
            # Dry run interrupted by Ctrl+C
            echo "" # Newline after potential tee output
            echo "Dry run interrupted (Ctrl+C detected). Switching to folder-by-folder sync..."

            # --- Folder-by-Folder Sync ---
            set -l last_folder_sync_status 0
            # List top-level items (including hidden) in the source directory
            for item in (ls -A "$source")
                set -l current_source_item "$source$item"
                echo "--> Syncing '$current_source_item'..."
                # Use the main sync options for each item
                rsync -a --no-D --inplace --stats --progress -v -h "$current_source_item" "$destination"
                set last_folder_sync_status $status
                if test $last_folder_sync_status -ne 0
                    echo "Warning: Sync failed for '$current_source_item' (Exit Status $last_folder_sync_status). Continuing with next item."
                    # Optionally break here if you want to stop on the first error:
                    # break
                end
            end
            echo "--- Folder-by-folder sync process finished. ---"
            # Return the status of the last sync command run in the loop
            return $last_folder_sync_status

        else if test $dry_run_status -ne 0
            # Other dry run errors
            echo "Error during dry run (Exit Status $dry_run_status). Aborting."
            return $dry_run_status
        end
        # If dry_run_status is 0, it falls through to the prompt/auto-confirm logic
    end # End if not quick_mode block

    # --- Proceed with Sync (if not quick mode interrupted or quick mode active) ---

    # Only prompt if not in quick mode AND not auto-confirming
    if not $quick_mode; and not $auto_confirm
        echo "" # Newline after potential tee output or quick mode message
        read -P 'Proceed with sync? (y/n) ' -l confirm
        set -l proceed_with_sync (test "$confirm" = "y")
    else
        # If quick mode or auto-confirm, proceed automatically
        if $quick_mode
            echo "Quick mode (-q) enabled. Skipping dry run and prompt. Starting sync..."
        else # Must be auto_confirm true here (and not quick_mode, handled above)
             echo "Auto-confirm (-y) enabled. Proceeding with sync..."
        end
        set -l proceed_with_sync true
    end


    if $proceed_with_sync
        echo "--- Starting Sync ---"
        # Refined main rsync command options:
        # -a: archive mode (includes -rlptgoD)
        # --no-D: explicitly do NOT transfer device/special files (overrides -a's D)
        # --inplace: overwrite destination files in place
        # --stats: print transfer statistics
        # --progress: show progress for each file
        # -v: verbose
        # -h: human-readable numbers (good with --stats)
        rsync -a --no-D --inplace --stats --progress -v -h "$source" "$destination"
        set -l last_status $status

        if test $last_status -eq 0
            echo "--- Sync Finished Successfully ---"
        else
            echo "--- Sync Finished with Errors (Exit Status $last_status) ---"
        end
        return $last_status
    else
        # This branch is only reached if not quick_mode, not auto_confirm, and user said 'n'
        echo "Sync cancelled."
        return 1
    end
end

