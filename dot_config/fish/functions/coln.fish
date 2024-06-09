function coln -d "Return argument # of a string"
    awk '{print $'$argv[1]'}'
end
