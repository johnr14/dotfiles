#
# These are very common and useful
#
function lal --wraps ls -d "List contents of directory, including hidden files in directory using long format with most recent files at top"
    eza -lAh --group-directories-first --icons --reverse --sort=modified --no-user --no-permissions $argv
end
