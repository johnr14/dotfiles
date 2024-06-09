function add_date -d "Append date in commandline"
    commandline -i (date '+%Y-%m-%d')
end

#Add in config.fish
#bind \ed add_date
