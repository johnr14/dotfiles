function domain -d "Return domain name from urm"
    read url
    echo $url | sed -r 's|.+://||' | cut -d / -f 1
end
