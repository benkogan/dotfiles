abbr -a e 'vim'

abbr -a c  'clear'
abbr -a l  'ls -lAh'
abbr -a cl 'clear; and ls -Ahl'
abbr -a ck 'clear; and ls -hl'
abbr -a cp 'cp -i'
abbr -a rm 'rm -i'
abbr -a mv 'mv -i'

abbr -a ga  'git add'
abbr -a gp  'git push'
abbr -a gf  'git fetch --all'
abbr -a gc  'git clone'
abbr -a gst 'git status'
abbr -a gaa 'git add --all'
abbr -a gcm 'git commit -m'
abbr -a gpo 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
abbr -a gsl 'git stash list'
abbr -a gb  'git branch'
abbr -a gbda 'git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

abbr -a gl  'git log --color | less -r'
abbr -a glg 'git log --graph --abbrev-commit --decorate --format=format:\'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(black)%s%C(reset) %C(white)- %an%C(reset)%C(bold yellow)%d%C(reset)\' --all'

abbr -a gdh 'git diff --color HEAD'
abbr -a gdl 'git diff --color HEAD | less -r'
abbr -a gdc 'git diff --cached'

abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'

abbr -a se 'stack exec'
abbr -a sb 'stack build'
abbr -a si 'stack ghci'

abbr -a vimrc  'eval $EDITOR ~/.vimrc'
abbr -a fishrc 'eval $EDITOR ~/.config/fish/config.fish'
abbr -a prompt 'eval $EDITOR ~/.config/fish/functions/fish_prompt.fish'
