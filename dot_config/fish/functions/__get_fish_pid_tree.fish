function __get_fish_pid_tree -d "Show process tree of fish pid"
    pstree -h -T -s -p $fish_pid
end
