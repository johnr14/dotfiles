function ssh --wraps ssh -d "Append needed information to ssh for kitty"
    if [ $TERM = xterm-kitty ]
        command kitty +kitten ssh $argv
    else
        command ssh $argv
    end

end
