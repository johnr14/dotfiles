#
# These are very common and useful
#
function l --wraps ls -d "List contents of directory, including hidden files in directory using long format"
    eza -Ah --group-directories-first --icons $argv
end
