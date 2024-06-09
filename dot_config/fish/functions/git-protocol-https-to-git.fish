function git-protocol-https-to-git -d "Convert current git from https to ssh git"
    sed -i 's|https://\(\([[:alnum:]]\+\.\)\+[[:alnum:]]\+\)/|git@\1:|' .git/config
end
