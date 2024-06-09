function retry -d "Keep retry until argv return 0"
    while true
        $argv && break
        sleep 1
    end
end
