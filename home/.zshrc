
###############################################################################
## Oh-My-ZSH Setup

# Path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
plugins=(git osx brew colored-man)
source $ZSH/oh-my-zsh.sh


###############################################################################
## Functions

# Set terminal title
DISABLE_AUTO_TITLE="true"
preexec () { print -Pn "\e]0;$1\a" }
precmd () { print -Pn "\e]0;%~\a" }

# Find man sections for builtins
bashman () { man bash | less -p "^       $1 "; }


###############################################################################
## Aliases

alias zshconfig="$EDITOR $HOME/.zshrc"
alias vimconfig="$EDITOR $HOME/.vimrc"
alias proj="cd ~/Projects/"
alias valg="valgrind --leak-check=yes --track-origins=yes"
alias c="clear"
alias a="ls -a1"
alias mytree="find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/'"

# Force mv, rm, and cp to ask user before clobbering file
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

# Show/hide hidden files in Finder
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"


###############################################################################
## Path

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# <https://github.com/wayneeseguin/rvm/issues/1351#issuecomment-10939525>
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin"

# Add python
if [ -d "/usr/local/share/python" ]; then
    PATH="/usr/local/share/python:$PATH"
fi

# Add RVM for scripting
PATH=$PATH:$HOME/.rvm/bin

if [ -d "/Users/Ben/scripts" ]; then
    PATH="/Users/Ben/scripts:$PATH"
fi

###############################################################################
## Exports

# Fix tmux colors (http://superuser.com/a/399326/247910)
export TERM=xterm-256color

export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


###############################################################################
## Add-Ons

# Homeshick dotfiles manager setup
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Homeshick: tab completion for ZSH
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Homeshick: check for dotfiles changes to pull every week
homeshick --quiet refresh

# Hub: alias as git
eval "$(hub alias -s)"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


