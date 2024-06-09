function __get_fish_parent_pid -d "Find parent pid that launched fish, will make sure to not return fish or bash"
    set -gx FISHPARENTPID $(ps -p $fish_pid -o ppid= | sed 's|[^0-9]||g')
    set -gx FISHPARENTNAME $(basename $(ps -o comm -f -p $FISHPARENTPID | tail -n1))
    #    echo $FISHPARENTPID $FISHPARENTNAME  
    if test "$FISHPARENTNAMESSHD" != sshd
        __check_fish_parent_for_invalid_parents
    end
    #echo "$FISHPARENTNAME($FISHPARENTPID)"
    echo $FISHPARENTPID
end
