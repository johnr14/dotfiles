function __check_tmux_parent_for_invalid_parents -d "Check parent process to find who launched tmux, will make sure it's not bash or fish"
    if string match -q bash $TMUXPARENTNAME ]
        set -gx TMUXPARENTPID $(ps -p $TMUXPARENTPID -o ppid= | sed 's|[^0-9]||g')
        set -gx TMUXPARENTNAME $(basename "$(ps -o comm -f -p $TMUXPARENTPID | tail -n1)")
    else if string match -q fish $TMUXPARENTNAME
        set -gx TMUXPARENTPID $(ps -p $TMUXPARENTPID -o ppid= | sed 's|[^0-9]||g')
        set -gx TMUXPARENTNAME $(ps -o comm -f -p $TMUXPARENTPID | tail -n1)
        set -gx TMUXPARENTNAME $(basename $TMUXPARENTNAME)
    end

    if string match -q bash $TMUXPARENTNAME
        __check_tmux_parent_for_invalid_parents
    else if string match -q fish $TMUXPARENTNAME
        __check_tmux_parent_for_invalid_parents
    end
    #    echo $TMUXPARENTNAME $TMUXPARENTPID
end
