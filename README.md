# My terminal configuration

This is my Terminal setup.

## Installation

Run this script:

    $ install.sh

This will install the prerequisites and create symbolink links to dot files (e.g. `.zshrc`).

I use [oh_my_zsh](http://ohmyz.sh/) to manage my zsh configuration.

## Tools

* [brew](http://brew.sh/): **the** package manager for your command-line on OSX
* [P4Merge](http://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools): I use it to resolve git conflicts using the `mergetool` git command. My configuration expects to find it in `/Applications/p4merge.app`

## Some Brew formula

* [trash](http://hasseg.org/trash/): let you send files to the trash from the command-line instead of using the *remorseless* `rm`
* [hub](https://hub.github.com/): useful command-line tool to interact with your GitHub repositories
* [z](https://github.com/rupa/z): quickly access most 'frecent' directory

## Local aliases

Sometimes you need some aliases for you local configuration, so in order to achieve this, the `.zshrc` searches for a `.zsh_custom_aliases` file to load.
