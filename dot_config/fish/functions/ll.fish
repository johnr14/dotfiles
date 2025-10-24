#
# These are very common and useful
#
function ll --wraps ls --description "List contents of directory using long format"
    eza -lh --group-directories-first --icons $argv
end
