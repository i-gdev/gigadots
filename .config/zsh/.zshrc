if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# Function to append a new path to $PATH. Only appends if the folder exists.
pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

pathappend $HOME/bin $HOME/.local/bin $HOME/.local/share usr/local/bin usr/bin bin

#General
export TERM=xterm-256color
export DOTFILES="$HOME/gigadots"
export GIGADOTS=$DOTFILES
export GEM_HOME="$HOME/gems"

# Default programs:
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="thorium"
export READER="zathura"

# Folders per Xdg specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"
export HISTFILE="$ZDOTDIR/.zhistory"
export FZF_BASE="$HOME/.config/fzf"
export NVIM_CONFIG_DIR="$HOME/.config/nvim"

zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

source "$HOME/.config/zsh/.aliasrc"

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm.dd.yyyy":

plugins=(git)

source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

