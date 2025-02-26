# sources
source ~/dotfiles/.aliases
source ~/dotfiles/.exports

autoload -Uz compinit && compinit

source <(kubectl completion zsh)

# Starship
eval "$(starship init zsh)"

# Sheldon
eval "$(sheldon source)"

# 履歴保存管理
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_ignore_space
# setopt share_history # 複数ターミナルでヒストリの共有


# config of zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions#configuration
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# パスを直接入力してもcdする
setopt AUTO_CD

# 環境変数を補完
setopt AUTO_PARAM_KEYS

# Run ls after cd
chpwd() {
	if [[ $(pwd) != $HOME ]]; then;
		ls
	fi
}


# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# # for gke-cloud-auth-plugin
# export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# homebrew git
export PATH="$(brew --prefix git)/bin/git:$PATH"
