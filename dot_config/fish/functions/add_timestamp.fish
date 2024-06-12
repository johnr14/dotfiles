function add_timestamp -d "Append timestamp in commandline"
    commandline -i (date +"%Y-%m-%d_%H-%M-%S")
    commandline -f repaint
end

#Add in config.fish
#bind \ed add_date
