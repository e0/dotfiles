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

function install_neovim {
  echo -n "=> Installing neovim ...\n"
  mkdir ~/.config
  brew install neovim/neovim/neovim
  echo -e "\t\tDone."
}

function install_vim_solarized_theme {
  echo -n "=> Install vim Solarized theme ... \n"
  mkdir ~/.vim/colors
  curl -o ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
  echo -e "\t\tDone."
}

function create_symlinks {
  echo -n "=> Creating symlinks...\n"

  rm ~/.zshrc
  rm -rf ~/.vim
  rm ~/.emacs
  rm -rf ~/.emacs.d
  rm ~/.vimrc

  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/vim ~/.config/nvim
  ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
  ln -s ~/dotfiles/emacs ~/.emacs.d

  echo -e "\t\tDone."
}

function install_yarn {
  echo -n "=> Installing yarn ...\n"
  brew install yarn
  echo -e "\t\tDone."
}

echo ""

# install_powerline_fonts
# install_neovim
create_symlinks
# install_vim_solarized_theme
# install_dein
# install_yarn


echo -e "\nAll done!"
