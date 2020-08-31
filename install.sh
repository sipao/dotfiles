#!/bin/zsh

git submodule update --init --recursive

DIR=$(cd $(dirname $0); pwd)

# prezto
setopt EXTENDED_GLOB
for rcfile in "~/dotfiles"/.zprezto/runcoms/^README.md(.N); do
  ln -s "~/${rcfile}" "~/dotfiles/.${rcfile:t}"
done

git config --global core.editor 'vim -c "set fenc=utf-8"'

brew bundle

# symlink dotfiles
ln -sf ~/dotfiles/.zprezto ~/.zprezto
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
