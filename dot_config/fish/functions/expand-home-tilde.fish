function expand-home-tilde -d "Replace ~ with \$HOME"
    cat - | string replace '~' $HOME
end
