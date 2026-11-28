# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS="$ID"
elif [ "$(uname -s)" = "FreeBSD" ]; then
    OS="freebsd"
else
    OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
fi

GIT_BIN="$(command -v git)"

if [ -n "$GIT_BIN" ]; then
    alias dotgit="$GIT_BIN --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"
fi

# alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
export PATH=~/.npm-global/bin:$PATH

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
. "$HOME/.cargo/env"
# . "$HOME/.dotnet/tools"

dotnew() {
  dotnet new console -o "$1"
  code -r "$1"
}

# export MOZ_ENABLE_WAYLAND=1
