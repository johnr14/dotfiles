function ltd --wraps=exa --description 'List directory tree using long format'
    exa -TD -l --group-directories-first --icons --no-permissions --no-user --no-time --no-filesize $argv
end
