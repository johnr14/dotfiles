#
# These are very common and useful
#
function lta --wraps eza -d "List contents of directory tree using long format"
    eza -T -lah --group-directories-first --icons --git-ignore $argv
end
