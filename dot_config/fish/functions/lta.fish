#
# These are very common and useful
#
function lta --wraps exa -d "List contents of directory tree using long format"
    exa -T -lah --group-directories-first --icons --git-ignore $argv
end
