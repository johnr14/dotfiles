function __get_fish_parent_name -d "Find parent name that launched fish, will make sure to not return fish or bash"
    set -l fish_parent_pid (__get_fish_parent_pid)
    set -gx fish_parent_name (ps -o cmd -f -p $(__get_fish_parent_pid) | tail -n1 | awk '{print $1}' |  tr -d ':|\^-')
    echo $fish_parent_name
end
