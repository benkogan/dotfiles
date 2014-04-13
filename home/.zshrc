# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="avit"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Set terminal title
preexec () { print -Pn "\e]0;$1\a" }
precmd () { print -Pn "\e]0;%~\a" }

# Aliases
alias zshconfig="$EDITOR $HOME/.zshrc"
alias vimconfig="$EDITOR $HOME/.vimrc"
alias proj="cd ~/Documents/Projects/"
alias os="~/Documents/Columbia\ classes/Operating\ Systems/"
alias valg="valgrind --leak-check=yes --track-origins=yes"
alias c="clear"
alias mytree="find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/'"
alias atom="/Applications/Atom.app/Contents/Resources/app/atom.sh $*"

## force mv, rm, and cp to ask user before clobbering file
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

## show/hide hidden files in Finder
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew colored-man)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# <https://github.com/wayneeseguin/rvm/issues/1351#issuecomment-10939525>
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# Add python to PATH
if [ -d "/usr/local/share/python" ]; then
    PATH="/usr/local/share/python:$PATH"
fi

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

if [ -d "/Users/Ben/scripts" ]; then
    PATH="/Users/Ben/scripts:$PATH"
fi

# Fix tmux colors (http://superuser.com/a/399326/247910)
export TERM=xterm-256color

export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Homeshick dotfiles manager setup
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Homeshick tab completion for ZSH
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
