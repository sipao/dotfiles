###########################################
# shell
###########################################
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###########################################
# Ruby
###########################################
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

###########################################
# Docker
###########################################
export DOCKER_CONTENT_TRUST=0
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'
alias dp='docker ps'
alias dx='docker exec -it'

###########################################
# Python
###########################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# auto_ls_after_cd
setopt auto_cd
function chpwd() { ls }

###########################################
# Alias
###########################################
alias cp="cp -v"
alias mv="mv -v"
alias lsa="ls -la"
alias ls="ls -GF"
alias cat="bat"
alias ga='git add'
alias gl='git log --graph --date-order --all --date=format:'\''%m/%d %H:%M'\'' --pretty=format:'\''%C(cyan)%h %C(yellow)%cn %Creset%cd%Cred%d%n%B'\'
alias gll='git log --oneline --decorate --graph'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimf='vim $(fzf)'
alias decode_unicode='sed -e '\''s/\\u\(....\)/\&#x\1;/g'\'' | nkf --numchar-input'

###########################################
# Kubernetes
###########################################
source <(kubectl completion zsh)
alias k="kubectl"
complete -o default -F __start_kubectl k

###########################################
# Google Cloud SDK
###########################################
#source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

###########################################
## Flutter
###########################################
export PATH="$PATH:/Users/ds/flutter/bin"

###########################################
# zplug
###########################################
source ~/.zplug/init.zsh

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"


export ANDROID_HOME=${HOME}/Library/Android/sdk
if [ -d "${ANDROID_HOME}" ]; then
  export PATH="${ANDROID_HOME}/bin:$PATH"
fi

# Platform-Toolsのパスを通す
export ANDROID_TOOL_PATH=${ANDROID_HOME}/platform-tools
if [ -d "${ANDROID_TOOL_PATH}" ]; then
  export PATH="${ANDROID_TOOL_PATH}:$PATH"
fi

###########################################
# Rust
###########################################
#source $HOME/.cargo/env
