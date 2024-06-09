function fish_title
    if [ -f /etc/os-release ]
        set linux_flavor $(cat /etc/os-release | grep -E "^ID=" | sed 's/ID=//')
    end

    if set -q CONTAINER_ID
        # We are in a distrobox container
        echo -e "󰆧 $linux_flavor@$CONTAINER_ID"
    else if test $(systemd-detect-virt) = kvm
        # We are in a kvm
        echo "[kvm] $linux_flavor@$hostname"
    else if set -q SSH_CLIENT
        echo -e "[ssh] $USER@$hostname"
    end

    if set -q in_distrobox
    end

end
