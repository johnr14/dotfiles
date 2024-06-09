function icons
    _tide_title Icons

    _tide_option 1 'Few icons'
    _tide_display_prompt

    _tide_option 2 'Many icons'
    _enable_icons
    _tide_display_prompt

    _tide_menu (status function)
    switch $_tide_selected_option
        case 'Few icons'
            _disable_icons
    end
    _next_choice all/transient
end

function _enable_icons
    set -p fake_tide_left_prompt_items os
    set -g fake_tide_pwd_icon 
    set -g fake_tide_pwd_icon_home 
    set -g fake_tide_cmd_duration_icon 
    set -g fake_tide_git_icon 
    set -g tide_git_icon_upstream_behind ⇣
    set -g tide_git_icon_upstream_ahead ⇡
    set -g tide_git_icon_stash 󱉰
    set -g tide_git_icon_conflicted 
    set -g tide_git_icon_staged 
    set -g tide_git_icon_dirty 
    set -g tide_git_icon_untracked 󰩌
end

function _disable_icons
    _tide_find_and_remove os fake_tide_left_prompt_items
    set fake_tide_pwd_icon
    set fake_tide_pwd_icon_home
    set fake_tide_cmd_duration_icon
    set fake_tide_git_icon
    set tide_git_icon_upstream_behind ⇣
    set tide_git_icon_upstream_ahead ⇡
    set tide_git_icon_stash *
    set tide_git_icon_conflicted ~
    set tide_git_icon_staged +
    set tide_git_icon_dirty !
    set tide_git_icon_untracked ?
end
