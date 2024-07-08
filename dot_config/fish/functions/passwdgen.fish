function passwdgen
  if begin; test (count $argv) -gt 0 2>/dev/null; and test $argv -gt 6 2>/dev/null; end
    tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c $argv
    echo ''
    #  else if [ $argv = "-h" ]
    #echo "Generate a password with (16) caracters or specify lenght as argument 1"
  else
    tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 16
    echo ''
  end
end
