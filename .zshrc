# Path to your oh-my-zsh installation.
export ZSH="/Users/lockyc/.oh-my-zsh"

ZSH_THEME="dracula-pro"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd nativefier

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

####################
# PATH configuration
####################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/lockyc/go/bin:$PATH"

############
# Aliases
############
alias gping='ping 8.8.8.8'
alias ls='exa --group-directories-first --header --git -F -l --icons'

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
		eval ${dotfile_cmd} $@
	fi
}

dc(){
	if [[ -z $1 ]] then
		docker-compose up -d
	else
		docker-compose $@
	fi
}

mkdir(){
	echo "Did you mean to use mkcd?"
	/bin/mkdir $@
}

nativefierupgrade() {
	NATIVEFIER_VERSION=$(nativefier --version)
	REGEX='"nativefierVersion":\W?"'$NATIVEFIER_VERSION'"'

	for file in /Applications/nativefier/*/*.app; do
		if [[ $(grep -E $REGEX $file'/Contents/Resources/app/nativefier.json') ]]; then
			echo "No update required for $file"
		else
			echo "Updating nativefier for $file"
			nativefier --upgrade $file
		fi
	done;
}

sysupdate() {
	# macos
	softwareupdate --all --install --force
	# Brew
	brew update 
	brew upgrade
	# Rust
	rustup self update
	rustup update stable
	# nvm & npm
	nvm use node
	npm update -g
	# nativefier (Important to makesure nvm is updated first)
	npm install -g nativefier
	nativefierupgrade
}

###########
# zsh config
###########
unsetopt share_history
setopt inc_append_history

eval "$(starship init zsh)"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/lockyc/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
