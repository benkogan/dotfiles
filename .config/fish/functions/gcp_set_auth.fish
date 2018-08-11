function gcp_set_auth -a file
  set --local config "$XDG_CONFIG_HOME/gcp-auth/$file"

  if test ! -e "$config"
    echo (in_color red "Error:") "GCP auth config file $file does not exist. Exiting."
    return
  end

  set --local project (read_line 1 $config)
  set --local account (read_line 2 $config)
  set --local credentials (read_line 3 $config)

  gcloud config set project "$project"
  echo (in_color blue "$project")
  gcloud config set account "$account"
  echo (in_color blue "$account")

  if test -n "$credentials"
    set --universal GOOGLE_APPLICATION_CREDENTIALS "$credentials"
    echo "Updated credential env variable."
    echo (in_color blue "$credentials")
  else if test -n "$GOOGLE_APPLICATION_CREDENTIALS"
    set --erase GOOGLE_APPLICATION_CREDENTIALS
    echo (in_color yellow "Cleared GOOGLE_ACCOUNT_CREDENTIALS.")
  end

  set --universal _GCLOUD_ACCOUNT "$account"
end

function read_line -a line_num -a file
  sed "$line_num"'q;d' "$file"
end

function in_color --argument-names color message
  if test -n "$message"
    printf '%s%s%s' (set_color $color) "$message" (set_color normal)
  end
end
