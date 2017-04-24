function drip
  set --local dir "$TMPDIR/drip-generated/"(date +%s)"/"
  set --local index "$dir/index.md"

  if test ! -d $dir
    mkdir -p $dir
  end

  echo "# Generated Index" >> $index
  for f in *.md
    cp $f $dir
    echo "- [$f](./$f)" >> $index
  end

  grip --quiet -b $index
end
