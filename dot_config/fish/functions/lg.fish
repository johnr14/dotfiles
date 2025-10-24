function lg --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    eza -hal --git --group-directories-first --icons --no-user --no-permissions $arg
    #git ls-files --modified | xargs -d '\n' eza -T -lh --icons -R
end
