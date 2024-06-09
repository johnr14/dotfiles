if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment 2>/dev/null
end

if not __ssh_agent_is_started
    __ssh_agent_start
end
