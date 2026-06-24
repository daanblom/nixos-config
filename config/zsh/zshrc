export ZSH=/usr/share/oh-my-zsh/

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# configure key keybindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

unsetopt prompt_sp
setopt CORRECT

# Bind Ctrl + Space to accept autosuggestions (same as right arrow)
bindkey '^ ' forward-char

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

plugins=(git)

export EDITOR='nvim'
export VISUAL='nvim'

kk () {
  sudo $(fc -ln -1);
}

todo () {
  local todoFile="/home/db/Obsidian/Svalbard/Personal/Plans/Todo.md"
  if [[ "$(cat /etc/hostname)" != "archServer" ]]; then
    ssh -t archServer "nvim $todoFile"
  else
    nvim "$todoFile"
  fi
}

groceries () {
  local groceriesFile="/home/db/Obsidian/Svalbard/Personal/Shopping/Groceries.md"
  if [[ "$(cat /etc/hostname)" != "archServer" ]]; then
    ssh -t archServer "nvim $groceriesFile"
  else
    nvim "$groceriesFile"
  fi
}

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias n="nvim"
alias s="setsid -f"
alias pm="sudo pacman -S"
alias pms="pacman -Ss"
alias pmu="sudo pacman -Syu"
alias ls='ls -h --color=auto'
alias l="ls"
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias grep='grep --color=auto'
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias tree="tree -C"
alias pa="ps aux | grep -i "
alias clock="termdown -z --no-seconds -f invita" 
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias dshred="shred -f -n 5 -v -x -z -u"
alias ddshred="shred -f -n 5 -v -x -z"
alias feh="feh --image-bg black -."
alias pyt="yt-dlp -S "res:1080" -o - $1 | mpv - "
alias icat="kitten icat"
alias lsp="ls++ 2>/dev/null --potsf "
alias knip="xsel --input --clipboard"
alias plak="xsel --output --clipboard"
alias tl="transmission-remote -l"
alias ta="tmux attach"
alias ns="notify-send"
alias td="termdown $1 min"
alias dzathura="~/.local/bin/zathura"
alias handbrake="ghb"

# Go
alias gmi="go mod init $(whoami)/$(pwd | grep -o '[^/]*$')"
alias gmt="go mod tidy"
alias gb="go build"

# # usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *.xz)        xz -d -v $1  ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.me/scripts"
export PATH="${PATH}:${HOME}/.local/bin/"
export TERM=xterm-256color

#source ~/.fzf.zsh

export CALIBRE_USE_DARK_PALETTE=1

set editing-mode vi
set keymap vi


# pnpm
export PNPM_HOME="/home/db/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
