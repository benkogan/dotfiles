# based on:
# http://apple.stackexchange.com/questions/107297

function playmidi
  set -l SOUNDFONT ~/bin/generaluser.v.1.44.sf2

  if test -e $SOUNDFONT

    for i in $argv
      if test -e $i
        fluidsynth -i $SOUNDFONT $i ^ /dev/null > /dev/null
      else
        echo "[playmidi]: cannot find file at $i"
        return 1
      end
    end

  else

    echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
    return 1

  end

end

