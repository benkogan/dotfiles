set -g fish_color_git_clean green
set -g fish_color_git_staged yellow
set -g fish_color_git_dirty red

set -g fish_color_git_added green
set -g fish_color_git_modified blue
set -g fish_color_git_renamed magenta
set -g fish_color_git_copied magenta
set -g fish_color_git_deleted red
set -g fish_color_git_untracked yellow
set -g fish_color_git_unmerged red

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

function fish_prompt
  set --local exit_status $status
  printf '%s%s%s%s: ' (colored_cwd) (p (git_info)) (p (time_if_long)) (p (error_if_error $exit_status))
end

function p
  set --local str "$argv[1]"
  if test -n $str
    printf ' %s' $str
  end
end

function colored_cwd
  printf (in_color $fish_color_cwd (prompt_pwd))
end

function git_info
  __fish_git_prompt '%s'
end

function time_if_long
  if test $CMD_DURATION
    if test $CMD_DURATION -gt 5000
      printf (in_color yellow (math $CMD_DURATION / 1000)"s")
    end
  end
end

function error_if_error
  set --local exit_status $argv[1]
  if test $exit_status -gt 0
    printf (in_color red x)
  end
end

function in_color
  set --local color "$argv[1]"
  set --local message "$argv[2]"
  printf '%s%s%s' (set_color $color) "$message" (set_color normal)
end
