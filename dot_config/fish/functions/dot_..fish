function .. -d "Same as `cd ..`, repeat n time"
    if test -z $argv[1]
        set n 1
    else
        set n $argv[1]
    end

    set nbcd ""
    for i in (seq $n)
        set nbcd ../$nbcd
    end

    if functions -q z
        z $nbcd
    else
        cd $nbcd
    end
end
