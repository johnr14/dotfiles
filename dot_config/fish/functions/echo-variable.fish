function echo-variable --no-scope-shadowing -d "Echo a variable with a \$ sign in upper case"
    if set -q -- $argv
        set varname $argv
    else
        set varname (echo $argv | string upper)
    end
    eval 'echo $'$varname
end
