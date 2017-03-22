function ct
  ctags \
   --recurse \
   --exclude=".git" \
   --c-kinds=+dts \
   ./*; and \
     ctags \
       --recurse \
       --exclude=".git" \
       --c-kinds="+dts" \
       --append="yes" \
       ~/repo-ext/*
end
