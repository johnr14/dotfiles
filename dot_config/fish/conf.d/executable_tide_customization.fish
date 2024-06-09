# tide configure --auto --style=Rainbow --prompt_colors='True color' \
# --show_time='24-hour format' --rainbow_prompt_separators=Vertical \
# --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat \
# --powerline_prompt_style='Two lines, character and frame' \
# --prompt_connection=Solid --powerline_right_prompt_frame=No \
# --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Sparse \
# --icons='Many icons' --transient=No

set --global tide_left_prompt_items os distrobox context pwd newline status character
set --global tide_context_always_display true
set --global tide_right_prompt_items cmd_duration git jobs direnv node python rustc java php pulumi ruby go gcloud kubectl toolbox terraform aws nix_shell crystal elixir zig time

set --global tide_pwd_bg_color black
set --global tide_pwd_color_dirs green
set --global tide_pwd_color_anchors brgreen
set --global tide_context_bg_color black
set --global tide_os_bg_color black
set --global tide_distrobox_bg_color black
set --global tide_distrobox_color yellow

# Color of the line
set --global tide_prompt_color_frame_and_connection green

# Leave the prompt in the terminal history
set --global tide_prompt_transient_enabled false
