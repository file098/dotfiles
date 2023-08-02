
# Path to your oh-my-zsh installation.
export ZSH="/home/file0/.oh-my-zsh"

ZSH_THEME="eastwood"

ENABLE_CORRECTION="true"

plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
 else
   export EDITOR='vim'
 fi

# Alias list

alias zshconfig="nano ~/.zshrc"
alias config="cd ~/.config"
