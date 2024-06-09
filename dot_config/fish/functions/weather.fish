function weather --description 'What is the weather?'
    set location (string escape --style=url "$argv")
    echo "http://wttr.in/$location"
    curl -fsSL "http://wttr.in/$location"
end
