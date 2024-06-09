
# https://unix.stackexchange.com/questions/235704/fish-sudo-command-not-found
# Allow running sudo !!
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else if test "$argv" = su
        # Preserve environment like SSH_*
        sudo -E /bin/sh -c "XDG_CONFIG_HOME=$HOME/.config fish"
    else if functions -q -- $argv[1]
        # Run the command in a fish shell
        set -l new_args (string join ' ' -- (string escape -- $argv))
        set argv fish -c "$new_args"
    else
        command sudo $argv
    end
end
