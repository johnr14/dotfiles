function confirm -d "Basic confirm prompt"
    read -P "$argv> " response
    contains $response y Y yes YES
end
