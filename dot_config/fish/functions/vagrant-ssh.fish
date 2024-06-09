function vagrant-ssh --argument-names name -d "Connect to vagrant \$name with ssh and start it if needed"
    # FIXME: check vagrant present
    vagrant ssh $name
    or begin
        if vagrant status | grep -E 'poweroff|aborted|not created|saved' >/dev/null
            vagrant up $name
            vagrant ssh
        end
    end
end
