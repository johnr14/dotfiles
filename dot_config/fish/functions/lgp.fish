function lgp --description 'List git modified files plain'
    git ls-files --modified | xargs -d '\n' eza -1
end
