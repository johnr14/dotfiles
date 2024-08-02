function envsource
    set -f envfile "$argv"
    if begin; not test -f "$envfile" begin; or not test -f .env; end
        echo "Unable to load $envfile"
        return 1
    end
    while read line
        if not string match -qr '^#|^$' "$line" # skip empty lines and comments
            if string match -qr '=' "$line" # if `=` in line assume we are setting variable.
                set item (string split -m 1 '=' $line)
                set item[2] (eval echo $item[2]) # expand any variables in the value
                set -gx $item[1] $item[2]
                echo "Exported key: $item[1]" # could say with $item[2] but that might be a secret
            else
                eval $line # allow for simple commands to be run e.g. cd dir/mamba activate env
            end
        end
    end <"$envfile"
end
