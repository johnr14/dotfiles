function wait_time --description "Run a command after some time: wait_time <minutes> <command args>"
    set minutes $argv[1]
    set time_in_seconds (math "$minutes*60")
    sleep $time_in_seconds; and eval "$argv[2..-1]"
end
