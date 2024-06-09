function addpaths -d "Append path permenantly to \$PATH if it's not existant"
    contains -- $argv $fish_user_paths
    or set -U fish_user_paths $fish_user_paths $argv
    #echo "Updated PATH: $PATH"
end
