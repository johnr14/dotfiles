function pubkey -d "Copy default public key to clipboard"
    if test -f ~/.ssh/id_rsa.pub
        cat ~/.ssh/id_rsa.pub | fish_clipboard_copy; and echo '=> Public key copied to clipboard.'
    else if test -f ~/.ssh/id_ed25519.pub
        cat ~/.ssh/id_ed25519.pub | fish_clipboard_copy; and echo '=> Public key copied to clipboard.'
    else
        echo 'No public key found.'
    end
end
