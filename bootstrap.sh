#!/bin/zsh
echo -e "\U1F300 Setting up your Mac..."

##########################################################
## symlinks
##########################################################
echo -e "\U2757 Re-install dotfiles?(y/N): "
if read -qs; then
  # .zshrc
  rm -rf ~/.zshrc
  ln -sf ~/dotfiles/.zshrc ~/.zshrc
  # gitconfig
  rm -rf ~/.gitconfig
  ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
fi

##########################################################
## macos
##########################################################
echo -e "\U1F34E Setup .macos? (y/N): "
if read -qs; then
  ./.macos
fi

##########################################################
## iTerm2
##########################################################
# Setting iTerm2
echo -e "\U1F371 Setting iTerm2...."
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

##########################################################
# Zsh sheldon
##########################################################
echo -e "\U1F50C Install sheldon? (y/N): "
if read -qs; then
  DIR_SHELDON=~/.config/sheldon/
  if [ ! -d "$DIR_SHELDON" ]; then
    mkdir -p "$DIR_SHELDON"
    echo "Directory '$DIR_SHELDON' created."
  fi
fi

ln -sf ~/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

##########################################################
## homebrew
##########################################################
#  Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo -e "\U1F34E Update brew? (y/N): "
if read -qs; then
  brew update
fi

echo -e "\U1F34F Install from Brewfile? (y/N): "
if read -qs; then
  brew bundle --file ./Brewfile
fi

##########################################################
## starship
##########################################################
#echo "Install Starship? (y/N): "
#if read -qs; then
#  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
#  echo eval "$(starship init zsh)" >> ~/.zshrc
#  ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
#fi

##########################################################
## AstroNvim
##########################################################
echo -e "\U1F47E Install AstroNvim? (y/N): "
if read -qs; then
  rm -rf ~/.config/nvim

  git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
  # remove template's git connection to set up your own later
  rm -rf ~/.config/nvim/.git
fi

##########################################################
## fin
##########################################################

echo -e "\U1F638 Dont forgot to install runcat"

source ~/.zshrc

