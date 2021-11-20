export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.emacs.d/bin:$PATH"

############
# Aliases
############
alias gping='ping 8.8.8.8'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfilesdown='dotfiles fetch && dotfiles pull'
alias dotfilesup='dotfiles commit -a --allow-empty-message -m "" && dotfiles push'
alias ls='exa --group-directories-first --header --git -F -l'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

###########
# zsh config
###########
setopt share_history



eval "$(starship init zsh)"
