#
# env - set environment vars
#

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

# __set_xdg_basedirs

set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state


# Set initial working directory.
set -g IWD $PWD

# Colorize man pages.
set -q LESS_TERMCAP_mb; or set -gx LESS_TERMCAP_mb (set_color -o blue)
set -q LESS_TERMCAP_md; or set -gx LESS_TERMCAP_md (set_color -o cyan)
set -q LESS_TERMCAP_me; or set -gx LESS_TERMCAP_me (set_color normal)
set -q LESS_TERMCAP_so; or set -gx LESS_TERMCAP_so (set_color -b white black)
set -q LESS_TERMCAP_se; or set -gx LESS_TERMCAP_se (set_color normal)
set -q LESS_TERMCAP_us; or set -gx LESS_TERMCAP_us (set_color -u magenta)
set -q LESS_TERMCAP_ue; or set -gx LESS_TERMCAP_ue (set_color normal)

# Make sure ~/.ssh folder exist
mkdir -p ~/.ssh

# XDG apps
# set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
#

# My special dirs
set -gx MY_PROJECTS $HOME/github

# Add bin directories to path.
if test -d ~/.local/bin
  fish_add_path --prepend $HOME/.local/bin
end
#fish_add_path --prepend $HOME/bin
