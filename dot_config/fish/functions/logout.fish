function logout -d "Log out of a ssh session no matter in how many nested session you are, add -k to kill tmux at the same time"
    # FIXME: add confirmation ?
    set -l SETKILL $(echo $argv | tr -d '-')
    set -l FISHPARENTNAMESSHD $(basename $(ps -o comm -f -p $(__get_fish_parent_pid) | tail -n1))
    set -l FISHPARENTPID $(__get_fish_parent_pid)

    if test $FISHPARENTNAMESSHD = sshd
        if test $SETKILL = k
            echo "logout -k will kill all tmux servers, press CTRL-C now to stop it!"
            sleep 1
            tmux kill-server &>/dev/null
            kill -HUP $FISHPARENTPID
        else
            kill -HUP $(__get_fish_parent_pid)
        end
    else if test $FISHPARENTNAMESSHD = "tmux: server"
        echo "You are in a TMUX session, detaching from session before exiting"
        set -l TMUXCLIENTPID $(tmux list-clients -F '#{client_pid}')
        set -Ux SSHDTOKILL $(__get_tmux_parent_sshd)

        if test $SETKILL = k
            fish -c 'sleep 1; kill -HUP $SSHDTOKILL && tmux kill-server' &
        else
            fish -c 'sleep 1; kill -HUP $SSHDTOKILL' &
            tmux detach
        end
    else
        echo "Not in sshd session"
        kill -HUP $(__get_fish_parent_pid)
    end
end
