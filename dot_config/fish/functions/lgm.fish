function lgm --description 'List git modified files'
    # git ls-files -m -o --exclude-standard | xargs -d '\n' eza -T -lh --icons -R
    #git ls-files -m -o --exclude-standard | xargs -d '\n' eza -hal --git --group-directories-first --icons --no-user --no-permissions
    #git diff --name-only | xargs -I '{}' realpath --relative-to=. $(git rev-parse --show-toplevel)/'{}' | xargs -d '\n' eza -hal --git --group-directories-first --icons --no-user --no-permissions
    #git status -s | awk '{print $2}' | grep -v '/$' | xargs -d '\n' eza -hal --git --group-directories-first --icons --no-user --no-permissions
    set filelist (git status -s | awk '{print $2}' | grep -v '/$' )
    #echo $filelist
    if test (count $filelist) -gt 0
        git status -s | awk '{print $2}' | grep -v '/$' | xargs -d '\n' eza -hal --git --group-directories-first --icons --no-user --no-permissions
    end
end
