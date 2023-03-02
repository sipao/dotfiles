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

# Install Nerd Fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

# Install AstroNvim
rm -rf ~/.config/nvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim/lua/user/ ~/.config/nvim/lua/user

