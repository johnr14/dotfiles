function pwdc -d "Copy \$PWD to clip-board"
    echo $(pwd) | fish_clipboard_copy
end
