function ga --description 'Git add with nice menu'
    echo "Changed files:"
    lgm
    #git ls-files -m -o --exclude-standard | fzf -m --print0 --height=~50% --border sharp --layout=reverse-list | xargs -0 -o -t git add
    git status -s | awk '{print $2}' | grep -v '/$' | fzf -m --print0 --height=~50% --border sharp --layout=reverse-list | xargs -0 -o -t git add
end
