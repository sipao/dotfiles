# sources
source ~/dotfiles/.aliases
source ~/dotfiles/.exports

# Starship
eval source <(/usr/local/bin/starship init zsh --print-full-init)

# Sheldon
eval "$(sheldon source)"

# 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# パスを直接入力してもcdする
setopt AUTO_CD

# 環境変数を補完
setopt AUTO_PARAM_KEYS

# asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
