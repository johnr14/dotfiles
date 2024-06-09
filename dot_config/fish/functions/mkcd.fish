function mkcd -d "Create directory and cd into it"
    mkdir $argv[1] -p
    if test -d "$argv[1]"
        z $argv[1]
    end
end
