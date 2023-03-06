#!/bin/zsh
echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Zsh
rm -rf ~/.zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

# Zsh sheldon
ln -sf ~/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

# symlinks
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "Install from Brewfile? (y/N): "
if read -q; then
  # Update Homebrew recipes
  brew update
  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  brew bundle --file ./Brewfile
fi

echo "Install Starship? (y/N): "
if read -q; then
  # Install starship
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
#  echo eval "$(starship init zsh)" >> ~/.zshrc
  ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
fi

echo "Install AstroNvim? (y/N): "
if read -q; then
  # Install AstroNvim
  rm -rf ~/.config/nvim
  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  ln -sf ~/dotfiles/.config/nvim/lua/user/ ~/.config/nvim/lua/user
fi

# Setting iTerm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Install GoogleCloudSDK? (y/N): "
if read -q; then
  brew install --cask google-cloud-sdk
fi


source ~/.zshrc

