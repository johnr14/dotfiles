function __get_tmux_parent_sshd -d "Find parent pid that launched tmux, will make sure to not return fish or bash"
    set -gx TMUXPARENTPID $(ps -p $(tmux list-clients -F '#{client_pid}') -o ppid= | sed 's|[^0-9]||g')
    set -gx TMUXPARENTNAME $(basename $(ps -o comm -f -p $TMUXPARENTPID | tail -n1))
    #echo $TMUXPARENTPID $TMUXPARENTNAME  
    if test "$TMUXPARENTNAME" != sshd
        __check_tmux_parent_for_invalid_parents
    end
    #echo "$FISHPARENTNAME($FISHPARENTPID)"
    echo $TMUXPARENTPID
end
