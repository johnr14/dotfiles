# Print current path in prompt without abreviating it
# TODO Check if private part works


function __prompt_long_pwd --description 'Print the current working directory'
    echo $PWD | sed -e "s|^$HOME|~|"
    #-e 's|/private||'
end
