# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
export DOTFILES=$HOME/.dotfiles

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load everything but the path and completion files
for file in config_files
do
  source $file
done


# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"


# Auto Suggestion configurations
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd|git) *"
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="(cd|git) *"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  dotenv
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


function __smart_completion() {
  if [ -n "$POSTDISPLAY" ]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}

zle -N __smart_completion
bindkey '\t' __smart_completion

. /usr/local/opt/asdf/libexec/asdf.sh

export GOROOT=$(asdf where golang)/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
