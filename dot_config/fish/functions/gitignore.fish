function gitignore -d "Add a file to the .gitignore file"
    #    FIXME: Check if in a git directory !
    set gitignore_file (git root)/.gitignore
    ensure-trailing-newline $gitignore_file
    for pattern in $argv
        echo $pattern >>$gitignore_file
    end
end
