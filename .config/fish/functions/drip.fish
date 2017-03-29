function drip
  set --local dir "$TMPDIR/drip-generated/"
  set --local tmp "$dir/index-"(date +%s)".md"

  if test ! -d $dir
    mkdir $dir
  end

  echo "# Generated Index" >> $tmp
  for f in *
    echo "- [$f]($pwd/$f)" >> $tmp
  end

  grip --quiet -b $tmp
end
