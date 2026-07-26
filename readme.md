<h1 align="center"> Xenodesire's personal dotfiles</h1>
<h3 align="center"> ━━━━━━ ❖ ━━━━━━ </h3>

![screenshot](/.config/screenshots/rice2.png)

My personal dotfiles. Made just as a backup for the day I want to test some new operating system to make my life easier. I'm cutting out what doesn't make sense in my setup in order to be as bloated as possible and as quick to install and configure everything. If you like the aesthetics, feel free to download it and adapt it to your machine. These dots are constantly changing, so keep an eye out for new updates.

## to install
This is mostly following Greg Owen's nice [post](https://stegosaurusdormant.com/bare-git-repo/) explaining why and how to set up a bare git repo for dotfiles. For more info there, or this tutorial on [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles).

### Setting up the bare git repo the first time
Create a new bare git repo in the home directory on the local machine where there are dotfiles to keep track of (using a .git suffix for a bare git repo is convention to follow):

```bash
git init --bare $HOME/dotfiles.git
```

Then add the following alias to your .bashrc or .zshrc, so you don't have to type it every time you want to add a file to the dofiles repo

```bash 
alias dotgit='git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
```

Make Git not show all the untracked files in the home dir, then add the remote (make the new repo on github first)

```.bash  
dotgit config status.showUntrackedFiles no
dotgit remote add origin https://github.com/xenodesire/dotforge.git

cat > .gitignore <<'EOF'
*

!.gitignore
!.Xresources
!.xinitrc
!.vimrc

!.config/
!.config/nvim/
!.config/nvim/**
!.config/i3/
!.config/i3/**
!.config/picom/
!.config/picom/**
!.config/kitty/
!.config/kitty/**
!.config/hypr/
!.config/hypr/**
!.config/waybar/
!.config/waybar/**
!.config/wezterm/
!.config/wezterm/**
!.config/btop/
!.config/btop/**
!.config/fastfetch/
!.config/fastfetch/**
!.config/clangd/
!.config/clangd/**
!.config/wallpapers/
!.config/wallpapers/**
!.config/screenshots/
!.config/screenshots/**

!.emacs.d/
!.emacs.d/init.el
!.emacs.d/early-init.el
!.emacs.d/lisp/
!.emacs.d/lisp/**

!.bashrc
!README.md
!.gitconfig
EOF
```

Then add the remote repository's origin.

```bash 
https://github.com/xenodesire/dotforge
```

Add a new file to track (e.g. .giconfig), and push while setting the remote branch at the same time (so in the future you just need to use git push:

```bash 
dotgit add ~/.gitconfig
dotgit commit -m "chore(gitconfig): track gitconfig"
dotgit push --set-upstream origin main
```

## Features 
Here's what's in here so far:

- <a href="/.config/btop">Btop</a>
- <a href="/.config/clangd">Clangd</a>
- <a href="./.emacs.d/">Emacs</a>
- <a href="/.config/fastfetch">FastFetch</a>
- <a href="/.config/hypr">hyprland</a>
- <a href="/.config/i3">I3wm</a>
- <a href="/.config/kitty">Kitty</a>
- <a href="/.config/nvim">Neovim</a>
- <a href="/.bashrc">Oh My Bash</a>
- <a href="/.config/picom">Picom</a>
- <a href="/.config/waybar">Waybar</a>
- <a href="/.config/wezterm">Wezterm</a>

## Acknowledgement
- [postylem/dotfiles](https://github.com/postylem/dotfiles-ARCHIVE)
- [wein1m/Windots](https://github.com/wein1m/Windots)
