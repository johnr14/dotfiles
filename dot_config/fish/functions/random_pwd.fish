function random_pwd -d "Generate 5 random passwords"
    for i in (seq 5)
        cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | fold -w 20 | head -n 1 | tr -d '\n' | fold -w 5 | tr '\n' -
        echo ''
    end
end
