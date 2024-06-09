function sch -d "Search for regex expressions through ripgrep, list them on fzf with bat preview and open selected file in $EDITOR"
    set --function filepath \
        (rg \
        --line-number \
        --no-heading \
        --color=always \
        --smart-case \
        --with-filename "$argv" \
    | fzf \
        -d ':' \
        -n 2.. \
        --ansi \
        --no-sort \
        --preview-window 'down:20%:+{2}' \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'\
  )
    set --function filename (echo $filepath | cut -d ':' -f 1)
    if test -n "$filename"
        $EDITOR $filename
    end
    if set -q filename[1]
        echo "No file selected"
    end
end
