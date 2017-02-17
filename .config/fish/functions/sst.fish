function sst -d "SSH into given box and start or attach to tmux."
  set --local session_name "persistent"
  ssh -t $argv "tmux attach || tmux new $session_name"
end
