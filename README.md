# [WIP]Sipao dotfiles v3

## Installation
1. `./bootstrap.sh`
2. `.gitconfig`上のnameやemailを変更
3. `.gitconfig`上のincludeIfを変更（複数のGitユーザーを使う為）
4. includeIfの対象に`.gitconfig`を配置する
```
[user]
  name = hogehoge
  email = fuga@example.com
```
5. 複数のGitHubアカウントを使い分けるために`~/.ssh/config`を設定する
```
Host github.com
  User git
  Port 22
  HostName github.com
  IdentityFile ~/.ssh/github_sipao
  TCPKeepAlive yes
  IdentitiesOnly yes
  
Host github_hoge
  User git
  Port 22
  HostName github.com
  IdentityFile ~/.ssh/github_hoge
  TCPKeepAlive yes
  IdentitiesOnly yes
 ```
上記の例だと、`g clone ssh://github_hoge.com/fuga/piyo.git`の様にホスト部分で切り替えることができる。


### Zsh Plugins
`.config/sheldon/plugins.toml`

### asdf
nodeやpython等、大体のものはこれをつかって管理する
- `asdf --help`
- `asdf plugin list all`

### Git prune
リモート上で削除済みのブランチをローカルでも削除（マージ済みブランチなど）
- `gprune` (`gfa`した後などに)
- `gprune [ -r | --remote | -b | --both ] <branch-name>`


## General setup
------

### Keyboard

### General

### Editor
- AstroNvim

### Terminal
- Terminal emulator: Warp
- Shell: zsh
- Plugin manager: sheldon
- Prompt: Starship

## Starship
Starship-Setting is `.config/starship.toml`

## Considering
- Eucalyn
- Dactyl manuform
- [DiffView](https://github.com/sindrets/diffview.nvim)
- Lazydocker

## Futures
- tmux
- Raycast
- https://github.com/nvim-telescope/telescope.nvim
- https://qiita.com/notakaos/items/701fad47605e586af268

## References
- [driesvints/dotfiles](https://github.com/driesvints/dotfiles)
- https://github.com/julianschuler/dotfiles
