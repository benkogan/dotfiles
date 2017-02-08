# Ben Kogan <http://benkogan.com>

source ~/.config/fish/environment/*

set -l j /usr/local/share/autojump/autojump.fish
if test -f $j; source $j; end

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

