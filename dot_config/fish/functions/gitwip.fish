function gitwip -d "quickly commit all changes with a wip flag and argv"
    if git diff --cached --quiet
        git add .
    end
    git commit --no-verify -m "wip $argv"
end
