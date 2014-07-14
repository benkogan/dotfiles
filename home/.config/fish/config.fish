
#
# config.fish
#
# Ben Kogan <http://benkogan.com>
#

set -x EDITOR vim
eval (hub alias -s)
source /usr/local/Cellar/autojump/HEAD/etc/autojump.fish
source $HOME/.homesick/repos/homeshick/homeshick.fish

alias c clear
alias e $EDITOR
alias cl 'clear; and l'
alias cp 'cp -i'
alias rm 'rm -i'
alias mv 'mv -i'
alias l 'ls -lah'
alias vimrc 'e ~/.vimrc'
alias fishrc 'e ~/.config/fish/config.fish'
alias vimhelp 'mad ~/.help/vim-help.md'
alias vvimhelp 'e ~/.help/vim-help.md'

function trash -d 'mv to trash'
  set -l trash_dir "$HOME/.Trash"
  set -l temp_ifs "$IFS"
  set IFS '\n'
  for item in $argv
    if test -e $item
      set -l item_name (basename $item)
      if test -e $trash_dir/$item_name
        mv -f $item $trash_dir/$item_name(date "+ %H.%M.%S")
      else
        mv -f $item $trash_dir/
      end
    end
  end
  set IFS $temp_ifs
end

