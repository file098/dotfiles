
# Path to your oh-my-zsh installation.
export ZSH="/home/file0/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
 else
   export EDITOR='vim'
 fi

# Alias list

alias zshconfig="nano ~/.zshrc"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias config="cd ~/.config"
alias update="sudo pacman -Syu"
alias status="sudo systemctl status"
