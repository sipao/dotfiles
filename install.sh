#!/bin/zsh
git submodule update --init --recursive

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

DIR=$(cd $(dirname $0); pwd)

# prezto
setopt EXTENDED_GLOB
for rcfile in "~/dotfiles"/.zprezto/runcoms/^README.md(.N); do
  ln -s "~/${rcfile}" "~/dotfiles/.${rcfile:t}"
done

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

brew bundle

pyenv install 3.8.5
pyenv global 3.8.5

pip3 install --user --upgrade neovim

rustup-init

# symlink dotfiles
ln -sf ~/dotfiles/.zprezto ~/.zprezto
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
mkdir ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim 

# Neovim dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
