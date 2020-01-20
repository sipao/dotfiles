source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zinit load zsh-users/zsh-completions # 補完2

zinit light zsh-users/zsh-autosuggestions
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit light motemen/ghq
zinit light junegunn/fzf
zinit light mollifier/anyframe
zinit light b4b4r07/enhancd

autoload -U compinit
compinit

zinit ice depth=1; zplugin light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
source  ~/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv custom_wifi_signal status dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs vcs time date)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_PATH_ABSOLUTE=false
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_left"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=20
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
POWERLEVEL9K_DATE_FORMAT="%D{%d.%m}"

# prompt
PROMPT='%m:%c %n$ '

autoload -Uz colors
colors

setopt share_history

setopt correct
setopt auto_cd

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias c='clear'
alias diff='colordiff'
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias v="vim"
alias vi='vim'
alias zshrc='v ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias zprofile='v ~/.zprofile'
alias szprofile='source ~/.zprofile'
# git
alias ga='git add'
alias gco='git checkout'
alias gc='git commit --verbose'
alias gp='git push'
alias gpa='git push --all'
alias gws='git status --short'
alias gb='git branch'
alias gfm='git pull'
alias gmF='git merge --no-ff'
alias gl="git log --graph --date-order --all --date=format:'%m/%d %H:%M' --pretty=format:'%C(cyan)%h %C(yellow)%cn %Creset%cd%Cred%d%n%B'"
alias gll="git log --oneline --decorate --graph"
alias grep="grep --color=auto"
alias gpc="git rev-parse --abbrev-ref HEAD | xargs git push origin"
alias gbd="git branch --delete"
alias gbD="git branch -D"
# docker
alias d='docker'
alias dc='docker-compose'
alias dcnt='docker container'
alias dcur='docker container ls -f status=running -l -q'
alias dexec='docker container exec -it $(dcur)'
alias dimg='docker image'
alias drun='docker container run --rm -d'
alias drunit='docker container run --rm -it'
alias dstop='docker container stop $(dcur)'


