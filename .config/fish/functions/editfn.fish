function editfn
  set --local name "$argv[1]"
  set --local path "$HOME/.config/fish/functions/$name.fish"

  if test ! -e $path
    echo "Error: file for $name function does not exist"
    return 1
  end

  vim $path
end
