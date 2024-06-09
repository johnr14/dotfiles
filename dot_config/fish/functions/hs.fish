function hs -d "history search with multiple keywords"
    set s ""
    for arg in $argv
        if test "$arg" = -t
            set s $s "| tail"
        else if test "$arg" = -h
            set s $s "| head"
        else
            set s "| grep -i" $arg $s
        end
    end

    set s history $s
    eval $s
end

#Usage

# hs sed myfile
# will search history for sed and myfile keywords
