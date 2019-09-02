function mkfn
  set --local name "$argv[1]"
  set --local path "$HOME/.config/fish/functions/$name.fish"

  if test -e $path
    echo "Error: file for $name function already exists"
    return 1
  end

  vim $path
end
