case $- in
*i*) ;;
*) return ;;
esac

export OSH='$HOME/.oh-my-bash'

OSH_THEME="font"
DISABLE_AUTO_UPDATE="true"

OMB_USE_SUDO=true

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source "$OSH"/oh-my-bash.sh

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

#alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
