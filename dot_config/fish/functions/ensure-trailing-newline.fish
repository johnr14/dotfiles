function ensure-trailing-newline --argument file -d "Ensure file has a trailing new line at the end of the file"
    if test -n (tail -c 1 $file)
        echo >>$file
    end
end
