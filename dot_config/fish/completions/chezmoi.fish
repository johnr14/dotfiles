complete -c chezmoi

# Subcommands
complete -c chezmoi -a "add age apply archive cat cat-config cd chattr completion data decrypt destroy diff doctor dump dump-config edit edit-config edit-config-template encrypt execute-template forget generate git help ignored import init license managed merge merge-all purge re-add secret source-path state status target-path unmanaged update upgrade verify"

# Subcommands with Descriptions
complete -c chezmoi -a "add" -d "Add an existing file, directory, or symlink to the source state"
complete -c chezmoi -a "age" -d "Interact with age"
complete -c chezmoi -a "apply" -d "Update the destination directory to match the target state"
complete -c chezmoi -a "archive" -d "Generate a tar archive of the target state"
complete -c chezmoi -a "cat" -d "Print the target contents of a file, script, or symlink"
complete -c chezmoi -a "cat-config" -d "Print the configuration file"
complete -c chezmoi -a "cd" -d "Launch a shell in the source directory"
complete -c chezmoi -a "chattr" -d "Change the attributes of a target in the source state"
complete -c chezmoi -a "completion" -d "Generate shell completion code"
complete -c chezmoi -a "data" -d "Print the template data"
complete -c chezmoi -a "decrypt" -d "Decrypt file or standard input"
complete -c chezmoi -a "destroy" -d "Permanently delete an entry"
complete -c chezmoi -a "diff" -d "Print the diff between target and destination states"
complete -c chezmoi -a "doctor" -d "Check your system for potential problems"
complete -c chezmoi -a "dump" -d "Generate a dump of the target state"
complete -c chezmoi -a "dump-config" -d "Dump the configuration values"
complete -c chezmoi -a "edit" -d "Edit the source state of a target"
complete -c chezmoi -a "edit-config" -d "Edit the configuration file"
complete -c chezmoi -a "edit-config-template" -d "Edit the configuration file template"
complete -c chezmoi -a "encrypt" -d "Encrypt file or standard input"
complete -c chezmoi -a "execute-template" -d "Execute the given template(s)"
complete -c chezmoi -a "forget" -d "Remove a target from the source state"
complete -c chezmoi -a "generate" -d "Generate a file for use with chezmoi"
complete -c chezmoi -a "git" -d "Run git in the source directory"
complete -c chezmoi -a "help" -d "Print help about a command"
complete -c chezmoi -a "ignored" -d "Print ignored targets"
complete -c chezmoi -a "import" -d "Import an archive into the source state"
complete -c chezmoi -a "init" -d "Setup the source directory and update the destination"
complete -c chezmoi -a "license" -d "Print license"
complete -c chezmoi -a "managed" -d "List the managed entries in the destination directory"
complete -c chezmoi -a "merge" -d "Perform a three-way merge"
complete -c chezmoi -a "merge-all" -d "Perform a three-way merge for each modified file"
complete -c chezmoi -a "purge" -d "Purge chezmoi's configuration and data"
complete -c chezmoi -a "re-add" -d "Re-add modified files"
complete -c chezmoi -a "secret" -d "Interact with a secret manager"
complete -c chezmoi -a "source-path" -d "Print the source path of a target"
complete -c chezmoi -a "state" -d "Manipulate the persistent state"
complete -c chezmoi -a "status" -d "Show the status of targets"
complete -c chezmoi -a "target-path" -d "Print the target path of a source path"
complete -c chezmoi -a "unmanaged" -d "List the unmanaged files in the destination directory"
complete -c chezmoi -a "update" -d "Pull and apply any changes"
complete -c chezmoi -a "upgrade" -d "Upgrade chezmoi to the latest version"
complete -c chezmoi -a "verify" -d "Verify destination matches target state"

# Flags (with Descriptions - already present in previous response but included for completeness)
complete -c chezmoi -l cache -r -d "Set cache directory"
complete -c chezmoi -l color -a "bool auto" -d "Colorize output"
complete -c chezmoi -s c -l config -r -d "Set config file"
complete -c chezmoi -l config-format -a "none json toml yaml" -d "Set config file format"
complete -c chezmoi -l debug -d "Include debug information in output"
complete -c chezmoi -s D -l destination -r -d "Set destination directory"
complete -c chezmoi -s n -l dry-run -d "Do not make any modifications"
complete -c chezmoi -l force -d "Make all changes without prompting"
complete -c chezmoi -s h -l help -d "Help for chezmoi"
complete -c chezmoi -l interactive -d "Prompt for all changes"
complete -c chezmoi -s k -l keep-going -d "Keep going after an error"
complete -c chezmoi -l mode -a "file symlink" -d "Mode"
complete -c chezmoi -l no-pager -d "Do not use the pager"
complete -c chezmoi -l no-tty -d "Do not attempt to get a TTY"
complete -c chezmoi -s o -l output -r -d "Write output to path"
complete -c chezmoi -l persistent-state -r -d "Set persistent state file"
complete -c chezmoi -l progress -a "bool auto" -d "Display progress bars"
complete -c chezmoi -s R -l refresh-externals -a "always auto never=always" -d "Refresh external cache"
complete -c chezmoi -s S -l source -r -d "Set source directory"
complete -c chezmoi -l source-path -d "Specify targets by source path"
complete -c chezmoi -l use-builtin-age -a "bool auto" -d "Use builtin age"
complete -c chezmoi -l use-builtin-diff -d "Use builtin diff"
complete -c chezmoi -l use-builtin-git -a "bool auto" -d "Use builtin git"
complete -c chezmoi -s v -l verbose -d "Make output more verbose"
complete -c chezmoi -l version -d "Version for chezmoi"
complete -c chezmoi -s W -l working-tree -r -d "Set working tree directory"

# File completions for relevant options (already present)
complete -c chezmoi -a "*" -f -l cache
complete -c chezmoi -a "*" -f -s c -l config
complete -c chezmoi -a "*" -f -s D -l destination
complete -c chezmoi -a "*" -f -s o -l output
complete -c chezmoi -a "*" -f -l persistent-state
complete -c chezmoi -a "*" -f -s S -l source
complete -c chezmoi -a "*" -f -s W -l working-tree

# Contextual file completions after subcommands (already present)
complete -c chezmoi -n "__fish_seen_subcommand_from add" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from cat" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from decrypt" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from edit" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from encrypt" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from execute-template" -a "*" -f
complete -c chezmoi -n "__fish_seen_subcommand_from import" -a "*" -f

# File completions for chezmoi itself (already present)
complete -c chezmoi -a "*" -f
