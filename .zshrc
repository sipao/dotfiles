# sources
source ~/dotfiles/.aliases
source ~/dotfiles/.exports

# Starship
eval source <(/usr/local/bin/starship init zsh --print-full-init)

autoload -Uz compinit && compinit

source <(kubectl completion zsh)

# Sheldon
eval "$(sheldon source)"

# 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt hist_ignore_dups

# config of zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions#configuration
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# パスを直接入力してもcdする
setopt AUTO_CD

# 環境変数を補完
setopt AUTO_PARAM_KEYS

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
