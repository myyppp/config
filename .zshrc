# Enable colors and change prompt:
autoload -U colors && colors
NEWLINE=$'\n'
PS1="${NEWLINE}%B%{$fg[blue]%}# %{$fg[cyan]%}%n %{$reset_color%}@ %{$fg[green]%}%M %{$reset_color%}in %{$fg[yellow]%}%~${NEWLINE}%{$fg[magenta]%}$%b "

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# 别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias la='ls -a'
alias vim='sudo vim'

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Custom zsh Binds
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5A' beginning-of-line
bindkey '\e[1;5B' end-of-line
bindkey '^z' undo

# Load ; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
