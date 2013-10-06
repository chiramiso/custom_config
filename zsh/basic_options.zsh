# Basic options

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pauls_cloud"

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

# Allow comments even in interactive shells (especially for Muness)
setopt INTERACTIVE_COMMENTS

# ===== Titlebar
# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# ===== Oh-My-Zsh-Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler rails ruby)

# ===== Prompt
# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST
unsetopt MENU_COMPLETE
setopt AUTO_MENU

# always use zsh in vim-mode
bindkey -v

# set VIMODE according to the current mode (default “[I]”)
VIMODE='[I]'
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/[N]}/(main|viins)/[I]}"
  zle reset-prompt
}

zle -N zle-keymap-select

# set default editor to vim
export EDITOR=vim

# set the PATH for rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
