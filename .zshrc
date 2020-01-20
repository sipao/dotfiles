source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zinit load zsh-users/zsh-completions # 補完2

zinit light zsh-users/zsh-autosuggestions
zinit ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

autoload -U compinit
compinit
