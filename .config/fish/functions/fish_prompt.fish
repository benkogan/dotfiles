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
  set --local border (in_color grey (repeatc '-' $COLUMNS))

  echo $border
  echo (curr_time) (colored_cwd) (echo "gcloud:"(gcloud_account)) (echo "git:"(git_user)) (git_info) (time_if_long) (error_if_error $exit_status)
  echo (in_color grey '> ')
end

function gcloud_account
  echo (in_color blue (echo "$_GCLOUD_ACCOUNT" | cut -f1 -d"@"))
end

function repeatc -a char -a length
  printf '%*s\n' $length "" | tr ' ' $char
end

function curr_time
  printf (in_color grey (date "+%H:%M:%S"))
end

function colored_cwd
  printf (in_color $fish_color_cwd (prompt_pwd))
end

function git_user
  # sed: cut between @ and .com, inc/exclusive
  echo (in_color blue (git config user.email | sed 's/^..*\(@..*\)\.com$/\1/'))
end

function git_info
  set --local git_root (git rev-parse --show-toplevel 2>/dev/null)
  if test -n "$git_root"
    set --local sl (git stash list)
    set --local stash_char ''
    if test -n "$sl"
      set stash_char '*'
    end

    set --local home_char ''
    if test "$git_root" = '/Users/Ben' -o "$git_root" = '/Users/bkogan' -o "$git_root" = '/home/bkogan'
      set home_char '&'
    end

    set --local branch (git branch | grep \* | cut -d ' ' -f2)
    set --local s (git status --porcelain)
    if test -n "$s"
      printf "%s%s%s" "$home_char" "$branch" "$stash_char"
    else
      printf "%s%s%s" "$home_char" (in_color blue "$branch") "$stash_char"
    end

    printf " %s" (git describe --tags --abbrev=0 2> /dev/null)
  end
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

function in_color --argument-names color message
  if test -n "$message"
    printf '%s%s%s' (set_color $color) "$message" (set_color normal)
  end
end
