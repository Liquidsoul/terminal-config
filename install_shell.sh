#!/bin/sh

function install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_oh_my_zsh
