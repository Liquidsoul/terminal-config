#!/bin/sh

# Install the configuration files as soft links in the current user home.

SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"

pushd $SCRIPT_DIR > /dev/null
for cfg_file in `ls -A | grep -Ev "^\.git(ignore)?$" | grep -E "^\."`
do
  src_path=$SCRIPT_DIR/$cfg_file
  link_path=~/$cfg_file
  if [ ! -e $link_path ]
  then
    ln -s $src_path $link_path
  else
    echo "Cannot create link '$link_path' because a file already exists there."
  fi
done
popd > /dev/null
