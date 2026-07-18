case $- in
*i*) ;;
*) return ;;
esac

export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# export OSH='/home/xenodesire/.oh-my-bash'

# OSH_THEME="font"
# DISABLE_AUTO_UPDATE="true"

# OMB_USE_SUDO=true
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# completions=(
#  git
#  composer
#  ssh
#)

# aliases=(
#  general
# )

# plugins=(
#  git
#  bashmarks
# )

# source "$OSH"/oh-my-bash.sh

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

#alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
# . "$HOME/.cargo/env"

