if status is-interactive
    # Commands to run in interactive sessions can go here
  set -gx EDITOR nvim

  # Bindings
# Fix for CTRL-BACKSPACE https://www.reddit.com/r/fishshell/comments/uqv70m/map_ctrlbackspace/
bind \cH backward-kill-word
# Fix for CTRL-DEL https://github.com/fish-shell/fish-shell/issues/1047
bind \e\[3\;5~ kill-word
# Fix for CTRL-SHIFT-BACKSPACE to delete until space
bind \e\[3\;5~ backward-kill-bigword

# Clear commandline on ctrl-r without leaving escape code
bind \cc 'commandline -r ""'

# Fzf files in directories with preview CRTL-\
bind \x1c _fzf_search_directory

# Press ctrl-f to launch lf to find a file or directory and add it to cmdline
bind \cf lf

# Press alt-d to add current date on prompt
bind \ed add_date
bind \et add_timestamp

end
