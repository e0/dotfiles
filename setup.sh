#!/bin/zsh

function install_neovim {
  echo -n "=> Installing neovim ...\n"
  mkdir ~/.config
  brew install neovim
  echo -e "\t\tDone."
}

function install_eza {
  echo -n "=> Installing eza ...\n"
  brew install eza
  echo -e "\t\tDone."
}

function install_node {
  echo -n "=> Installing node ...\n"
  brew install node
  echo -e "\t\tDone."
}

function install_bun {
  echo -n "=> Installing bun ...\n"
  npm install -g bun
  echo -e "\t\tDone."
}

function install_ripgrip {
  echo -n "=> Installing ripgrip ...\n"
  brew install ripgrep
  echo -e "\t\tDone."
}

function create_symlinks {
  echo -n "=> Creating symlinks...\n"

  # Remove existing configurations
  rm ~/.zshrc
  rm -rf ~/.config/nvim

  # Create symlinks
  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/nvim ~/.config/nvim

  echo -e "\t\tDone."
}

echo ""

install_eza
install_neovim
install_node
install_bun
create_symlinks

echo -e "\nAll done!"
