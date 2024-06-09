alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl "ipconfig getifaddr en0" #internal network IP
alias ips "ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# vim alias
alias vdot "nvim ~/.dotfiles"
alias vconf "nvim ~/.config/"
alias todo "nvim $SECONDBRAIN/01-Projects/TODO/"


# Alias certain directories :
alias docs "z ~/Documents/"
alias dl "z ~/Downloads/"
alias dot "z ~/.dotfiles/"
