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

# Managing secrets without exposing your encrypted files on the public repository.

1. Create empty branch

2. Create README.md

3. Add, commit and push private branch to github
  - Note this commit should be only the README.md !

4. Make the branch locked by going in `Settings` on github page
  - In `Branches` click `Add classic branch protection rule`
  - Check `Lock branch` and `Do not allow bypassing the above settings`

5. Delete local private branch
  - `git branch -d private`

6. Create new private branch
  - `git branch -b private`

7. Push private branch to private repository and set relation
  - `git push --set-upstream dot-private private`

8. Remove remote private branch on origin
  - `git branch --delete --remotes origin/private`

9. Install hooks to overwrite `.gitignore` with `.gitignore@branch` when using `git switch|checkout`
  - `cp post-checkout .git/hooks`
  - `cp post-checkout .git/hooks/post-switch`
  - TODO: Automate hooks install with chezmoi

> [!CAUTION]
> You must copy hooks to .git folder every time you install your dotfiles !

10. Test that when in `main` branch, your .gitignore will not track files that should not be public
  - Test for by : 
   ```
   touch ~./ssh/test.file ~/.gnupg/test.file
   chezmoi add ~.ssh/ ~/.gnupg/
   cd $(chezmoi source-path); git switch main; status && git commit -am "test private branch not leaking in public" && git push origin main 
   cd $(chezmoi source-path); git switch private; status && git commit -am "test private branch not leaking in public" && git push dot-private private 
   ```

11. Check diff between main and private branch
  - `git diff main..private`

12. Add private stuff in main branch and check that it's not marked as new file
  - Switch to private branch before adding/re-adding files with `chezmoi add|re-add`
   - `cd $(chezmoi source-path); git switch main`

> [!CAUTION]
> Always merge from main->private and not the other way around unless you are a git veteran. CHECK no sensible files are marked before any commit.

13. TODO:
  - Automate with chezmoi
    - Ask for github user
    - Ask if use your own dotfiles-private branch
    - Change origin to your own
    - Keep upstream to johnr14/dotfiles to be able to ask merge for improvement or benefit from upstream improvement
    - Changing of git branches for remote private at dotfiles-private
    - Remove origin/private
    - Pull dotfiles-private/private
  - Generate a ssh key for current user
