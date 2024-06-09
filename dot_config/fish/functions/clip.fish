function clip -d "Copy content to clipboard"
    echo -n $argv | fish_clipboard_copy
end
