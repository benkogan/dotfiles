
#
# config.fish
#
# Ben Kogan <http://benkogan.com>
#

. ~/.config/fish/environment/*

alias c clear
alias l 'ls -lah'
alias cp 'cp -i'
alias rm 'rm -i'
alias mv 'mv -i'

alias e $EDITOR
alias vimrc 'e ~/.vimrc'
alias fishrc 'e ~/.config/fish/config.fish'
alias vimhelp 'mad ~/.help/vim-help.md'
alias evimhelp 'e ~/.help/vim-help.md'

alias gp 'git push'
alias gl 'git log --color | less -r'
alias gdh 'git diff --color HEAD | less -r'
alias gst 'git status'
alias gaa 'git add -A'
alias gcm 'git commit -m'

set -l j /usr/local/share/autojump/autojump.fish
if test -f $j; . $j; end

function battery
  ioreg -n AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; printf("%d%%", max>0? 100*c["\"CurrentCapacity\""]/max: "?")}'
  echo ''
end

function cl
  clear
  printf '%s · %s%s%s\n\n' (date '+%a %d %h · %H:%M %p') (set_color green) (battery) (set_color normal)
  ls -lah
  echo
end

function dl
  cd $argv[1]
  cl
end

