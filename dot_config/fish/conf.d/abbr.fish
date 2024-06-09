set -q MY_ABBRS_INITIALIZED; and return

# Common errors
abbr --add --position command cd.. 'cd ..'
abbr --add --position command clean clear
abbr --add --position command exi exit
abbr --add --position command exti exit
abbr --add --position command hotp htop
# Date time timestamp
abbr --add ISODATE (date '+%Y-%m-%d') # FIXME NOT WORKING
# Editor
abbr --add --position command v nvim
abbr --add --position command vim nvim
# Fedora
abbr --add --position command dnfi 'sudo dnf install -C'
abbr --add --position command dnfq 'dnf info -C'
abbr --add --position command dnfs 'dnf search -C'

# Git
abbr --add --position command gclone 'git clone --recurse-submodules'
abbr --add --position command --set-cursor=! gc 'git commit -m "!"'
abbr --add --position command gp 'git push -u origin HEAD'
abbr --add --position command gs 'git status'
abbr --add --position command gu gitui
abbr --add ISODATE (date '+%Y-%m-%d') # FIXME NOT WORKING
# Multimedia
abbr --add --position command chill mpv --force-window=no --no-video --no-terminal "https://www.youtube.com/watch?v=jfKfPfyJRdk" &
abbr --add --position command mpvk "pkill mpv"
# Pipes
abbr --add --set-cursor=! awkp "awk '{print \$!}'"
# Safety
abbr --add --position command cp 'cp -i'
abbr --add --position command ln 'ln -i'
abbr --add --position command lns 'ln -si'
abbr --add --position command mv 'mv -i'
abbr --add --position command rm 'rm -Iv'
# System tools
abbr --add --position command rsync 'rsync -Pa --progress'
abbr --add --position command sysc 'sudo systemctl'
abbr --add --position command syscu 'systemctl --user'
# Users and files
abbr --add --position command chgrp 'chgrp --preserve-root -v'
abbr --add --position command chmod 'chmod --preserve-root -v'
abbr --add --position command chown 'chown --preserve-root -v'
# Web
abbr --add --position command flac 'youtube-dl -x --audio-format flac --audio-quality 0 -o "~/Music/%(uploader)s/%(title)s.%(ext)s"'
abbr --add wget 'wget --hsts-file="$XDG_DATA_HOME/wget-hsts" -c'


set -g MY_ABBRS_INITIALIZED true
