# Ben Kogan <http://benkogan.com>

for f in ~/.config/fish/environment/*.fish
  source $f
end

set -l j /usr/local/share/autojump/autojump.fish
if test -f $j; source $j; end

if test -z "$_GCLOUD_ACCOUNT"
  printf '%s%s%s\n' (set_color green) "Setting default GCP credentials." (set_color normal)
  gcp_set_auth default
  echo
end
