
#
# config.fish
#
# Ben Kogan <http://benkogan.com>
#

source ~/.config/fish/environment/*

set -l j /usr/local/share/autojump/autojump.fish
if test -f $j; source $j; end

abbr -a e 'vim'

abbr -a c  'clear'
abbr -a l  'ls -lah'
abbr -a cp 'cp -i'
abbr -a rm 'rm -i'
abbr -a mv 'mv -i'

abbr -a ga  'git add'
abbr -a gp  'git push'
abbr -a gu  'git pull'
abbr -a gc  'git clone'
abbr -a gb  'git branch'
abbr -a gl  'git log --color | less -r'
abbr -a gdh 'git diff --color HEAD | less -r'
abbr -a gst 'git status'
abbr -a gaa 'git add --all'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'

abbr -a se 'stack exec'
abbr -a sb 'stack build'
abbr -a si 'stack ghci'

abbr -a vimrc  'eval $EDITOR ~/.vimrc'
abbr -a fishrc 'eval $EDITOR ~/.config/fish/config.fish'
abbr -a prompt 'eval $EDITOR ~/.config/fish/functions/fish_prompt.fish'


function battery
  set -l x (which ioreg)

  if test -z x
    echo '---'
  else
    ioreg -n AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; printf("%d%%", max>0? 100*c["\"CurrentCapacity\""]/max: "?")}'
    echo
  end
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

