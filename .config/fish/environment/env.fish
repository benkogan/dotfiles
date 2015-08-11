
#
# assorted environment variables
#

set -x EDITOR vim
set -x TERM xterm-256color
set -x XDG_CONFIG_HOME ~/.config
set -x PYTHONSTARTUP ~/.config/python/startup.py

for dir in '~/bin' '~/.sandbox/.cabal-sandbox/bin' '/usr/texbin'
  if test -e $dir
    set -x fish_user_paths $fish_user_paths $dir
  end
end

