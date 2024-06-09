chezmoi - dotfiles
===========

This is my attempt to centralise my dotfiles using chezmoi.

Use at your own risk.

Take what you want, give credit when needed :)

# TOFIX


# Installation
`ASK=1 
chezmoi init --apply --verbose https://github.com:johnr14/dotfiles.git`


# Useful commands

## Pull updates
```
chezmoi git pull -- --autostash --rebase && chezmoi diff
chezmoi apply
```

# TODO

0. Add color and symbol theme
1. Add encryption
2. fix run_ for handeling exceptions
3. manage package list to install in independant files
4. add more dotfiles
5. configure hyprland
7. use ansible for system setup ?
8. manage ssh and gpg keys
9. pass


# TOCHECK

1. SSH handeling
2. Nested session
3. TMUX

