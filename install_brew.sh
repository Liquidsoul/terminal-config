#!/bin/zsh

# Install `brew` and `brew bundle`

if ! which -s brew > /dev/null; then
  echo "brew not found, installing it..."
  # install command from http://brew.sh
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "brew installed, continuing..."
fi

if brew tap-info homebrew/bundle | grep 'Not installed'; then
  echo "brew bundle not found, installing it..."
  brew tap Homebrew/bundle
fi

SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
pushd $SCRIPT_DIR > /dev/null

echo "Processing brewfile..."
brew bundle

popd > /dev/null
