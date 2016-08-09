#!/bin/zsh


install_dein () {
  echo -n "=> Installing dein.vim ...\n"
  mkdir ~/dein_vim
  curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dein_vim/installer.sh
  sh ~/dein_vim/installer.sh ~/dotfiles/vim/dein
  rm -rf ~/dein_vim/
  echo -e "\t\tDone."
}

install_vim_solarized_theme () {
  echo -n "=> Install vim Solarized theme ... \n"
  mkdir ~/.vim/colors
  curl -o ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
  echo -e "\t\tDone."
}

create_symlinks () {
  echo -n "=> Creating symlinks...\n"

  rm ~/.zshrc
  rm -rf ~/.vim
  rm ~/.vimrc
  rm ~/.i3
  rm ~/.Xmodmap

  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/vimrc ~/.vimrc
  ln -s ~/dotfiles/vim ~/.vim
  ln -s ~/dotfiles/i3 ~/.i3
  ln -s ~/dotfiles/Xmodmap ~/.Xmodmap

  echo -e "\t\tDone."
}


echo ""

create_symlinks
install_vim_solarized_theme
install_dein


echo -e "\nAll done!"
