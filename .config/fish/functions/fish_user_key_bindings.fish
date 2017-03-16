function fish_user_key_bindings
  # Make ^C clear line.
  # https://github.com/fish-shell/fish-shell/issues/3537#issuecomment-260355642
  bind \cc 'commandline ""'
end
