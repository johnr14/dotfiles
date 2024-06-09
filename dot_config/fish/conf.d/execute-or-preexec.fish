
function execute-or-preexec
    # this is to merge history on exter with no arguments
    set -l cmd (commandline)
    if test -z "$cmd"
    #echo -n "Debug: history merge"
        history save
        history merge
        commandline -f repaint
    else 
      # Transform path 
      #commandline-paths-to-absolute
      #history-last-cmd-paths-to-absolute
      commandline -f execute
    end
end

bind \r execute-or-preexec
