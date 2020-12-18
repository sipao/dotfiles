#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# pyenv
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

# alias g='git'
# alias gc='git commit --verbose'
# alias gco='git checkout'
# alias gmF='git merge --no-ff'

alias ga='git add'

alias gl='git log --graph --date-order --all --date=format:'\''%m/%d %H:%M'\'' --pretty=format:'\''%C(cyan)%h %C(yellow)%cn %Creset%cd%Cred%d%n%B'\'
alias gll='git log --oneline --decorate --graph'

alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

###########################################
# Google Cloud SDK
###########################################
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

###########################################
#zplug
###########################################
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh
#source ~/.zplug/init.zsh

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
