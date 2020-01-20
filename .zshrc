### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin load momo-lab/zsh-abbrev-alias # 略語を展開する
zplugin load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zplugin load zsh-users/zsh-completions # 補完2
