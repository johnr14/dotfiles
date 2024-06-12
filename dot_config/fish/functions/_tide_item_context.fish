set -l _tide_item_context_ssh (set_color bryellow; echo -ns "[SSH]")

function _tide_item_context
    if set -q SSH_TTY
        set -fx tide_context_color $tide_context_color_ssh
        string match -qr "^(?<h>(\.?[^\.]*){0,$tide_context_hostname_parts})" @$hostname
        if test "$EUID" = 0
          _tide_print_item context "$(set_color bryellow)" "[SSH] \\033[9;31m$SUDO_USER->\\033[m$(set_color $tide_context_color_ssh)$USER$h"
        else
          _tide_print_item context "$(set_color bryellow)" "[SSH]$(set_color $tide_context_color_ssh) $USER$h"
        
        end
    else if test "$EUID" = 0
        set -fx tide_context_color $tide_context_color_root
        string match -qr "^(?<h>(\.?[^\.]*){0,$tide_context_hostname_parts})" @$hostname
        _tide_print_item context "\\033[9;31m$SUDO_USER->\\033[m$USER$h"
    else if test "$tide_context_always_display" = true
        set -fx tide_context_color $tide_context_color_default
        string match -qr "^(?<h>(\.?[^\.]*){0,$tide_context_hostname_parts})" @$hostname
        _tide_print_item context "$USER$h"
    else
        return
    end
end
