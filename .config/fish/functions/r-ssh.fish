function r-ssh -d "Refresh ssh auth within tmux."
  if test -n $TMUX
    set --local new_ssh_auth_sock (tmux show-environment "SSH_AUTH_SOCK"\
                                   | cut --delimiter="=" --fields=2)

    if test -n $new_ssh_auth_sock -a -S $new_ssh_auth_sock
      printf "sock was  %s\n" $SSH_AUTH_SOCK
      set --export SSH_AUTH_SOCK $new_ssh_auth_sock
      printf "sock is   %s\n" $SSH_AUTH_SOCK
      printf "tmux says %s\n" (tmux show-environment "SSH_AUTH_SOCK" | cut -d "=" -f 2)
    end
  end
end
