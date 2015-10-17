#!/bin/sh

# Install `brew` and `brew bundle`

function install_brew() {
  if ! which -s brew > /dev/null; then
    echo "brew not found, installing it..."
    # install command from http://brew.sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "brew installed, continuing..."
  fi
}

function install_brew_bundle() {
  if brew tap-info homebrew/bundle | grep 'Not installed'; then
    echo "brew bundle not found, installing it..."
    brew tap Homebrew/bundle
  else
    echo "brew bundle installed, continuing..."
  fi
}

function execute_brew_bundle() {
  SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
  pushd $SCRIPT_DIR > /dev/null

  echo "Processing brewfile..."
  brew bundle

  popd > /dev/null
}

install_brew

install_brew_bundle

execute_brew_bundle
