for dir in '~/bin' '/usr/texbin'
  if test -e $dir
    set -x fish_user_paths $fish_user_paths $dir
  end
end
