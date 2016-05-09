#!/bin/zsh

function install_powerline_fonts {
  echo -n "=> Installing powerline fonts ...\n"
  mkdir ~/powerline_fonts
  curl -L https://github.com/powerline/fonts/archive/master.zip | tar -xz -C ~/powerline_fonts --strip-components=1
  ~/powerline_fonts/install.sh
  rm -rf ~/powerline_fonts/
  echo -e "\t\tDone."
}

function install_dein {
  echo -n "=> Installing dein.vim ...\n"
  mkdir ~/dein_vim
  curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dein_vim/installer.sh
  sh ~/dein_vim/installer.sh ~/dotfiles/vim/dein
  rm -rf ~/dein_vim/
  echo -e "\t\tDone."
}

function install_vim {
  echo -n "=> Installing vim ...\n"
  brew install vim
  echo -e "\t\tDone."
}

function create_symlinks {
  echo -n "=> Creating symlinks...\n"

  rm ~/.zshrc
  rm -rf ~/.vim
  rm ~/.vimrc

  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/vimrc ~/.vimrc
  ln -s ~/dotfiles/vim ~/.vim

  echo -e "\t\tDone."
}


echo ""

install_powerline_fonts
install_dein
install_vim
create_symlinks


echo -e "\nAll done!"
