
function fish_prompt
  printf '%s %s %s: ' (exit_status_icon $status) (colored_cwd) (parse_git_branch)
end

function exit_status_icon
  if test $argv[1] -gt 0
    printf '%s%s%s' (set_color red) (status_icon) (set_color normal)
  else
    printf '%s' (no_status_icon)
  end
end

function status_icon
  printf '·'
end

function no_status_icon
  printf ' '
end

function colored_cwd
  printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function parse_git_branch
  if test -n (git_diff)
    current_git_branch
  else
    printf '%s%s%s' (set_color green) (current_git_branch) (set_color normal)
  end
end

function git_diff
  printf '%s' (git diff)
end

function current_git_branch
  git branch ^ /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/'
end

