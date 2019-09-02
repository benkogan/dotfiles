# Ben Kogan <http://benkogan.com>

for f in ~/.config/fish/environment/*.fish
  source $f
end

set -l j /usr/local/share/autojump/autojump.fish
if test -f $j; source $j; end

