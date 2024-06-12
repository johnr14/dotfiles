
# Todo
# - timeout for network transaction
# - run in background 
# - more colors

function fish_greeting -d "This will show the greeting screen"

    set -l UPTIME (echo $(awk '{print $1}' /proc/uptime) / 60 | bc)
    if [ "$UPTIME" -ge 15 ]
    #return 0
    end

    # Check if parent pid is an other fish shell and do nothing if it is

    #  set -l parent_pid_name (ps -o cmd -p (ps -o ppid= -p $fish_pid | tail -n1 | tr -d '^-') | tail -n1 | tr -d '^-')
    set -l parent_pid_name (ps -o comm -p (ps -o ppid= -p $fish_pid | tail -n1 | tr -d '^-| ') | tail -n1)
    if test "$parent_pid_name" = fish
        #echo "parent pid = " $parent_pid_name
        #echo "parent fish"
        echo "Running in a nested fish shell :" (__get_fish_pid_tree)
        return 0
    else
        #echo "parent pid = " $parent_pid_name
    end

    clear
    # Do checks

    # Neofetch
    if command -s fastfetch >/dev/null
        fastfetch
    else if command -s /usr/bin/neofetch >/dev/null
        /usr/bin/neofetch --disable packages resolution theme icons --color_blocks off --backend off
    end

    #dfc
    if command -s dfc >/dev/null
        unbuffer dfc -d -T -t ext2,ext3,ext4,zfs,btrfs,fuseblk,ntfs,fat,xfs,nfs,fuse 2&>/dev/null | tail -n +2 | sort | awk '!seen[$1]++'
    end

    set_color -o brblue
    printf "\nNetwork:\n"
    set_color normal
    #IP
    #  echo ""

    set PUBLICIP $(curl -s ifconfig.co 2> /dev/null)
    set VALIDIP $(echo $PUBLICIP | grep -E "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")

    if test $VALIDIP
        set REVDNS $(host $VALIDIP 2> /dev/null | awk '{ print substr($NF, 1, length($NF)-1)}')
        #printf 'Public IP = %s %80s\n' "${LIGHTBLUE}$PUBLICIP${WHITE}" "Reverse DNS = ${LIGHTBLUE}$REVDNS${WHITE}" # Right alignment of REVDNS
        echo "Public IP = $PUBLICIP            $REVDNS"
    else
        echo "No public ip"
    end

    # Interfaces
    set IFACES $(ifconfig 2>/dev/null | grep "flags=" | tr ':' ' '| awk '{print $1}' | grep -v lo)

    for IFACE in $IFACES
        # Check if ip valid https://www.shellhacks.com/regex-find-ip-addresses-file-grep/
        set VALIDIP $(ifconfig $IFACE 2>/dev/null | grep -E "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")
        if test $VALIDIP
            ifconfig $IFACE 2>/dev/null | grep -E "flags=|inet" | tr '\n' ' ' | sed -e 's/  */ /g' | sed 's/flags=.*inet //; s/prefixlen.*//' | awk '{print $0}'
        end
    end

    # Users and process
    echo ""
  
    #set LOGGEDUSERS $(w -f -i -s -h | awk '{print $1}' | sort | uniq -c | tr '\n' ' ' | grep -o '[^$(printf '\t') ].*')
    set LOGGEDUSERS $(w -f -i -h | awk '{print $1}' | wc -l)
    if test -z "$LOGGEDUSERS"
        set LOGGEDUSERS 1
    end
    printf "Users logged in : "
    set_color red
    printf "%s\n" $LOGGEDUSERS
    set_color normal   

    w -f -i -h
    echo ""
    printf "There are "
    set_color red
    printf "%s" $(ps aux | tail -n +2 | wc -l)
    set_color normal
    printf " processes running.\n"

    printf "\nTop memory hungry process:\n"
    if command -s procs >/dev/null
        setterm -linewrap off
        procs -c always -p disable --sortd mem 2>/dev/null | head -12
    end

    echo ""
end
