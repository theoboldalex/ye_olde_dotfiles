# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alextheobold/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# User configuration

alias vi="nvim"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias srczsh="source ~/.zshrc"

alias ga="git add"
alias gcm="git commit -m"
alias gs="git status"
alias gp="git push"
alias nah='git reset --hard;git clean -df'

alias d="docker"
alias dc="docker-compose"
alias dps="docker ps"
alias art="php artisan"

alias python="python3"
alias pip="pip3"

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"

# PHP Versions
export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH=~/.composer/vendor/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
alias dotfiles='/usr/bin/git --git-dir=/Users/alextheobold/.dotfiles/ --work-tree=/Users/alextheobold'
