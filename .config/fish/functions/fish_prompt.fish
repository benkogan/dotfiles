
function parse_git_branch
  set -l branch (git branch ^ /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo $branch
  else
    echo (set_color green)$branch(set_color normal)
  end
end

function exit_status_icon
  set -l icon ' '

  if test $status -gt 0
    echo (set_color red)$icon(set_color normal)
  else
    echo $icon
  end
end

function colored_cwd
  set -l cwd (prompt_pwd)
  echo (set_color $fish_color_cwd)$cwd(set_color normal)
end

function fish_prompt
  set -l icon (exit_status_icon)

  if test -d .git
    printf '%s %s %s: ' $icon (colored_cwd) (parse_git_branch)
  else
    printf '%s %s: ' $icon (colored_cwd)
  end
end

