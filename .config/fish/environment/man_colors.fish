# colored man pages for fish shell

# begin blinking
set -x LESS_TERMCAP_mb \e'[01;31m'

# begin bold
set -x LESS_TERMCAP_md \e'[01;38;5;74m'

# end mode
set -x LESS_TERMCAP_me \e'[0m'

# end standout-mode
set -x LESS_TERMCAP_se \e'[0m'

# begin standout-mode - info box
#set -x LESS_TERMCAP_so \e'[38;5;246m'
#set -x LESS_TERMCAP_so (tput bold; tput setaf 2)
set -x LESS_TERMCAP_so \e'[01;37;40m'


# end underline
set -x LESS_TERMCAP_ue \e'[0m'

# begin underline
set -x LESS_TERMCAP_us \e'[04;38;5;146m'
