#!/bin/zsh

function install_neovim {
  echo -n "=> Installing neovim ...\n"
  mkdir ~/.config
  brew install neovim
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo -e "\t\tDone."
}

function install_exa {
  echo -n "=> Installing exa ...\n"
  brew install exa
  echo -e "\t\tDone."
}

function install_node {
  echo -n "=> Installing node ...\n"
  brew install node
  echo -e "\t\tDone."
}

function install_pnpm {
  echo -n "=> Installing pnpm ...\n"
  npm install -g pnpm
  echo -e "\t\tDone."
}

function install_neovim_fuzzy_dependencies {
  echo -n "=> Installing neovim-fuzzy dependencies ...\n"
  brew install fzy
  brew install rg
  echo -e "\t\tDone."
}

function setup_typescript {
  echo -n "=> Installing node packages for neovim, typescript ...\n"
  pnpm install -g neovim
  pnpm install -g typescript
}

function setup_python {
  echo -n "=> Installing python, pynvim, virtualenv, and black ...\n"
  brew install python
  pip3 install --user pynvim
  pip3 install virtualenv
  pip3 install black
  echo -e "\t\tDone."
}

function setup_prettier {
  echo -n "=> Installing node packages for prettier ...\n"
  pnpm --global add prettier
  echo -e "\t\tDone."
}

function create_symlinks {
  echo -n "=> Creating symlinks...\n"

  rm ~/.zshrc
  rm -rf ~/.vim
  rm ~/.vimrc

  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/vim ~/.config/nvim
  ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

  echo -e "\t\tDone."
}

echo ""

install_exa
install_neovim
install_neovim_fuzzy_dependencies
install_node
install_pnpm
setup_typescript
setup_prettier
# setup_python
create_symlinks

echo -e "\nAll done!"
