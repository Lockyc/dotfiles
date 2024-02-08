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

############
# Aliases
############
alias gping='ping 8.8.8.8'
alias ls='exa --group-directories-first --header --git -F -l --icons'
alias cat='bat'
alias nativefierdefaults="nativefier --darwin-dark-mode-support --strict-internal-urls --single-instance --disable-old-build-warning-yesiknowitisinsecure"
alias config="code ~\.scripts && code ~\.zshrc"

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

insta360FileCopy(){
	bkupdir="/Users/lockyc/TempFilesLongTerm/Insta360-Xfer-$(date +%Y_%m_%d_%H_%M_%S)"
	# bkupdir2="/Volumes/Cairns Patios/Insta360-Xfer-$(date +%Y_%m_%d_%H_%M_%S)"
  mkdir -p "${bkupdir}$1"
  # mkdir -p "${bkupdir2}$1"
	cp /Volumes/Untitled/DCIM/Camera01/* "${bkupdir}$1"
	# cp /Volumes/Untitled/DCIM/Camera01/* "${bkupdir2}$1"
	open "${bkupdir}$1"
	# open "${bkupdir2}$1"
	open /Volumes/Untitled/DCIM/Camera01
}

# Update nativefier applications
# "-z $1", any parameters to force upgrade to ensure everything is updated and to avoid old build message instead of suppressing
nativefierupgrade() {
	NATIVEFIER_VERSION=$(nativefier --version)
	REGEX='"nativefierVersion":\W?"'$NATIVEFIER_VERSION'"'

	echo "Nativefier Version: "$NATIVEFIER_VERSION

	for file in /Applications/nativefier/*/*.app; do
		if [[ -z $1 && $(grep -E $REGEX $file'/Contents/Resources/app/nativefier.json') ]]; then
			echo "No update required for $file"
		else
			echo "Updating nativefier for $file"
			nativefier --upgrade $file
		fi
	done;
}

# Update macOS, installed applications etc
# "-z $1", any parameters to skipp updating macos if we know there is pending update so update script doesnt hang
sysupdate() {
	if [[ -z $1 ]] then
		# macOS
		banner "macOS"
		softwareupdate --all --install --force
	
		# macOS app store
		banner "macOS app store"
		mas upgrade
	fi

	# oh my zsh
	banner "oh my zsh"
	omz update --unattended

	# brew
	banner "brew"
	brew update 
	brew upgrade
	brew cleanup
	brew list > ~/.scripts/brew_programs_list.txt # Reinstall all: xargs brew install < brew_programs_list.txt

	# rust
	banner "rust"
	rustup self update
	rustup update stable

	# nvm & npm
	banner "nvm & npm"
	find ~/.nvm -name '.DS_Store' -type f -delete
	nvm use node
	npm update -g

	# nativefier
	banner "nativefier"
	npm install -g nativefier
	nativefierupgrade

	banner "Sysupdate Done."

	banner "Status of dotfile repo"

	dotfiles status
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

eval "$(mcfly init zsh)"
eval "$(starship init zsh)"
source /Users/lockyc/.npm-run.plugin.zsh/npm-run.plugin.zsh
