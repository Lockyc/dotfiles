# Path to your oh-my-zsh installation.
export ZSH="/Users/lockyc/.oh-my-zsh"

ZSH_THEME="dracula-pro"

zstyle ':omz:update' mode reminder

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
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/lockyc/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

############
# Aliases
############
alias gping='ping 8.8.8.8'
alias ls='exa --group-directories-first --header --git -F -l --icons'
alias cat='bat'

############
# Functions
############

# Helper function to manage dotfiles in bare repository.
# replaces previous aliases
dotfiles() {
	local dotfile_cmd="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

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

_dotfiles() { 
  compadd up down status add
} 

compdef _dotfiles dotfiles

# Docker Compose Helper
dc(){
	if [[ -z $1 ]] then
		docker-compose pull && docker-compose up -d && docker-compose ps
	else
		docker-compose $@
	fi
}

# Reminder to use mkcd
mkdir(){
	echo "Did you mean to use mkcd?"
	/bin/mkdir $@
}

# Update nativefier applications
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

# Update macOS, installed applications etc
sysupdate() {
	if [[ -z $1 ]] then
		# macOS
		banner "macOS"
		softwareupdate --all --install --force
	fi
	# macOS app store
	banner "macOS app store"
	mas upgrade

	# oh my zsh
	banner "oh my zsh"
	omz update --unattended

	# brew
	banner "brew"
	brew update 
	brew upgrade
	brew cleanup

	# rust
	banner "rust"
	rustup self update
	rustup update stable

	# nvm & npm
	banner "nvm & npm"
	nvm use node
	npm update -g

	# nativefier
	banner "nativefier"
	npm install -g nativefier
	nativefierupgrade

	banner "Done."
}

banner() {
  printf "\n"
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}


###########
# zsh config
###########
unsetopt share_history
setopt inc_append_history

eval "$(starship init zsh)"
