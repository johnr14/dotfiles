function lt --wraps=exa --description 'List contents of directory tree using long format'
    exa -T -lh --group-directories-first --icons --no-permissions --no-user --no-time $argv
end
