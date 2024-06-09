function commandline-paths-to-absolute -d 'Check for filename and if it exist, convert to absolute path'
      set -l tokens (commandline --tokenize)
      set -l new_tokens
      for token in $tokens
          if test -e $token
              set new_tokens $new_tokens (readlink -m $token)
          else
              set new_tokens $new_tokens $token
          end
      end
      commandline -r (echo $new_tokens | tr '\n' ' ')
  end

bind \ea commandline-paths-to-absolute
