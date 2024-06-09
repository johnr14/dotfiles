function duck -d "Launch web browser and search for argv"
    open 'https://duckduckgo.com/?q='(echo $argv | string replace --all ' ' '%20')
end
