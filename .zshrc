# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/lockyc/.oh-my-zsh"

ZSH_THEME="dracula-pro"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

####################
# User configuration
####################

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# This lazy loads nvm
nvm() {
	unset -f nvm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
	nvm $@
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/lockyc/go/bin:$PATH"

############
# Aliases
############
alias gping='ping 8.8.8.8'
alias ls='exa --group-directories-first --header --git -F -l --icons'
alias nativefierupgrade='for file in /Applications/nativefier/*/*.app; do nativefier --upgrade $file; done;'
alias sysupdate='softwareupdate --all --install --force && brew update && brew upgrade && rustup self update && rustup update stable && nvm use node && npm install -g nativefier && npm update -g && nativefierupgrade'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

############
# Functions
############

# Helper function to manage dotfiles in bare repository.
# replaces previous aliases
dotfiles() {
	local dotfile_cmd="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

	if [[ -z $1 ]] then
		echo "Usage: $0 {down|up|status|<git commands>}"
	elif [[ $1 = "up" ]] then
		dotfiles down # grab updates first
		eval ${dotfile_cmd} commit --allow-empty-message -am \"\" && eval ${dotfile_cmd} push
	elif [[ $1 = "down" ]] then
		eval ${dotfile_cmd} fetch && eval ${dotfile_cmd} pull
	else
		eval ${dotfile_cmd} ${@:1}
	fi
}


###########
# zsh config
###########
# setopt share_history
unsetopt share_history

eval "$(starship init zsh)"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/lockyc/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
