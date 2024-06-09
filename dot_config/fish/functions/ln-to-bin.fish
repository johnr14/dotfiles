function ln-to-bin --description "Add to user's ~/.local/bin path" --argument executable
    # TODO : TEST ME!!
    if test -f $executable
        and test -x $executable
        symlink $executable ~/.local/bin/
    else if test -f $executable
        chmod u+x $executable; and symlink $executable ~/.local/bin/; or {echo "File $executable is not executable and could not be set as executable"; exit 1}
    else
        echo "File $executable doesn't existing."
        exit 1
    end
end
