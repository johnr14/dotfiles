function last-download -d "Show last downloaded file in ~/Downloads"
    echo ~/Downloads/(ls -t ~/Downloads/ | head -1)
end
