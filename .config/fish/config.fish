
#
# config.fish
#
# Ben Kogan <http://benkogan.com>
#

set -x EDITOR vim
set -x TERM xterm-256color
# set -x PATH ~/.cabal/bin $PATH
. /usr/local/Cellar/autojump/HEAD/etc/autojump.fish
. $HOME/.homesick/repos/homeshick/homeshick.fish

# colored man pages
set -x LESS_TERMCAP_mb \e'[01;31m'          # begin blinking
set -x LESS_TERMCAP_md \e'[01;38;5;74m'     # begin bold
set -x LESS_TERMCAP_me \e'[0m'              # end mode
set -x LESS_TERMCAP_se \e'[0m'              # end standout-mode
set -x LESS_TERMCAP_so \e'[38;5;246m'       # begin standout-mode - info box
set -x LESS_TERMCAP_ue \e'[0m'              # end underline
set -x LESS_TERMCAP_us \e'[04;38;5;146m'    # begin underline

alias c clear
alias cl 'clear; and l'
alias cp 'cp -i'
alias rm 'rm -i'
alias mv 'mv -i'
alias l 'ls -lah'

alias e $EDITOR
alias vimrc 'e ~/.vimrc'
alias fishrc 'e ~/.config/fish/config.fish'
alias vimhelp 'mad ~/.help/vim-help.md'
alias vvimhelp 'e ~/.help/vim-help.md'

## TODO: see https://gist.github.com/baojie/6567756
## TODO: see https://gist.github.com/visionmedia/4998585
alias gp 'git push'
alias gl 'git log --color | less -r'
alias gb 'git branch'
alias gco 'git checkout'
alias gcob 'git checkout -b'
alias gst 'git status'
alias gdh 'git diff --color HEAD | less -r'
alias gaa 'git add -A'
alias gcm 'git commit -m'

function trash -d 'Move to trash'
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

