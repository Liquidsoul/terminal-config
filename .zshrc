# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Soliah"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(git textmate ruby lighthouse rails3 rvm osx)
plugins=(git brew gem bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/Applications/p4merge.app/Contents/MacOS

# load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

__rvm_project_rvmrc

#Shows little symbol '±' if you're currently at a git repo and '○' all other times
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo '○'
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


# Build the main prompt
function powerline_precmd() {
  PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [[ -e ~/powerline-shell.py ]] && [[ "$TERM" != "linux" ]]; then
  install_powerline_precmd
elif [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ${return_code}$(git_prompt_status)%{$reset_color%} $(virtualenv_info)$(prompt_char) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✎"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  # Display exitcode on the right when >0
  return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

  # Displays different symbols (simultaneously) depending on the current status of your git repo.
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
  PROMPT='[%n@%m:%~$(git_prompt_info)]
  %# '

  ZSH_THEME_GIT_PROMPT_PREFIX=" on"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=" ✎"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  # Display exitcode on the right when >0
  return_code="%(?..%? ↵)"

  RPROMPT='${return_code}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

if [ -f ~/.zsh_custom_aliases ]
then
  source ~/.zsh_custom_aliases
fi

# z setup
. `brew --prefix`/etc/profile.d/z.sh

# PATH setup
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/python # Add python dir for pip

# change git plugin 'gl' from 'git pull' go 'git log'
alias gl='git log --decorate --graph --date=iso'
