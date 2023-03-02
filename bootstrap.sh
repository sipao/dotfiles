#!/bin/zsh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
#if test ! $(which brew); then
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
#  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
#  eval "$(/opt/homebrew/bin/brew shellenv)"
#fi

# Zsh
rm -rf ~/.zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

# symlinks
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Update Homebrew recipes
#brew update

# Install all our dependencies with bundle (See Brewfile)
#brew tap homebrew/bundle
#brew bundle --file ./Brewfile

# Install NvChad
#rm -rf ~/.config/nvim/
#mkdir -p ~/.config/nvim/
git submodule add -b main https://github.com/NvChad/NvChad .config/nvim
mkdir -p nvchad/custom
ln -sf ~/dotfiles/nvchad/custom .config/nvim/lua/

