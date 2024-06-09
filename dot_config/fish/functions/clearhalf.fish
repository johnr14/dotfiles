function clearhalf -d "Clear half the terminal"
    # get pos of cursor
    set -gx halfscreen $(stty size | cut -d' ' -f1 | awk '{print int($1/2)}' )
    if test $(math "$halfscreen %2") -eq 1
        set -gx newpos (math $halfscreen -2)
        #echo $halfscreen
    else
        set -gx newpos $halfscreen
    end
    set -gx bitmorethanhalfscreen $(stty size | cut -d' ' -f1 | awk '{print int($1/2)+4}' )
    #echo "halfscreen is:'$halfscreen'" 
    if test -x ~/.local/bin/curpos.sh
        set -l currentpos $(~/.local/bin/curpos.sh)
        if test $currentpos -gt $bitmorethanhalfscreen
            #echo "$bitmorethanhalfscreen GRATER than $currentpos"
            for i in (seq $halfscreen)
                echo ''
            end && tput cup $newpos 0 && tput ed
        else
            clear
        end
    end
    #    tput cup $(stty size|awk '{print int($1/2);}') 0 && tput ed

    #    for i in (seq $halfscreen); echo '' ; end && tput cup $halfscreen 0 && tput ed
    #echo "halfscreen is:'$halfscreen'" 
end
