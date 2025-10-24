function lt --wraps=eza --description 'List contents of directory tree using long format'
    eza -T -lh --group-directories-first --icons --no-permissions --no-user --no-time $argv
end
