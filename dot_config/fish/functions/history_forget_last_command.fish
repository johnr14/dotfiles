function history_forget_last_command -d "Forget last command and remove it from history"
    set last_typed_command (history --max 1)
    history delete --exact --case-sensitive "$last_typed_command"
    true
end
