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

