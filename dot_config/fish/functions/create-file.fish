function create-file --argument target -d "Create a empty file along with all directories in it's path"
    mkdir -p (dirname $target)
    touch $target
end
