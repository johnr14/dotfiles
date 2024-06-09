function __check_fish_parent_for_invalid_parents -d "Check parent process to find who launched fish, will make sure it's not bash or fish and return real parent"
    if string match -q bash $FISHPARENTNAME ]
        set -gx FISHPARENTPID $(ps -p $FISHPARENTPID -o ppid= | sed 's|[^0-9]||g')
        set -gx FISHPARENTNAME $(basename "$(ps -o comm -f -p $FISHPARENTPID | tail -n1)")

    else if string match -q fish $FISHPARENTNAME
        set -gx FISHPARENTPID $(ps -p $FISHPARENTPID -o ppid= | sed 's|[^0-9]||g')
        set -gx FISHPARENTNAME $(ps -o comm -f -p $FISHPARENTPID | tail -n1)
        set -gx FISHPARENTNAME $(basename $FISHPARENTNAME)
    end

    if string match -q bash $FISHPARENTNAME
        __check_fish_parent_for_invalid_parents
    else if string match -q fish $FISHPARENTNAME
        __check_fish_parent_for_invalid_parents
    end
end
