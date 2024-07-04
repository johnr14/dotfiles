function gopcd
cd $(gopass config | grep "^mounts.path" | awk '{print $3}')
end
