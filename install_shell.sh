#!/bin/sh

function install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_powerline_fonts() {
  if [ ! -e powerline-fonts ]; then
    echo "powerline-fonts not found!"
    exit 1
  fi

  pushd powerline-fonts > /dev/null

  if ! ./install.sh; then
    echo "Failed to install powerline fonts"
    exit 1
  fi

  popd > /dev/null
}

function install_powerline_shell() {
  # powerline shell
  if [ ! -e powerline-shell ]; then
    echo "powerline-shell not found!"
    exit 1
  fi

  powerline_config_name=powerline-config.py
  if [ ! -e $powerline_config_name ]; then
    echo "powerline shell config file not found"
  fi

  # copy my config.py into powerline-shell
  cp $powerline_config_name powerline-shell/config.py

  pushd powerline-shell > /dev/null

  export python2=`which python`
  if ! ./install.py; then
    echo "Failed to install powerline-shell"
    exit 1
  fi

  install_powerline_shell_path=~/powerline-shell.py

  if [ -e $install_powerline_shell_path ]; then
    echo "Cannot setup powerline-shell.py because $install_powerline_shell_path already exists."
  else
    ln -s `pwd`/powerline-shell.py $install_powerline_shell_path
  fi

  popd > /dev/null # powerline-shell
}

SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"

pushd $SCRIPT_DIR > /dev/null

install_oh_my_zsh

install_powerline_fonts

install_powerline_shell

popd > /dev/null # $SCRIPT_DIR
