function ltd --wraps=eza --description 'List directory tree using long format'
    eza -TD -l --group-directories-first --icons --no-permissions --no-user --no-time --no-filesize $argv
end
