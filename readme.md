<h1 align="center"> Xenodesire's personal dotfiles</h1>
<h3 align="center"> ━━━━━━ ❖ ━━━━━━ </h3>

![screenshot](/.config/screenshots/rice-atom-onedark-colors.png)

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

### Installing sddm 

I am assuming you are using Arch Linux; therefore, this guide is initially aimed at Arch users. Later, I will add a guide for whichever other distro you might be using.

- To instal sddm, please run `sudo pacman -S sddm` in your terminal to install the package.
- And then install qt6-wayland and qt5-wayland to prevent visual bugs on the login screen.

> [!NOTE]
> For the SDDM theme, I use the `sddm-astronaut-theme` backend, with a modification tailored to my "rice's" color palette. To install this modification, you will need to have `[sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)` installed.
> After installing the sddm-astronaut-theme, you will need to create a symlink applying my modification to the sddm-astronaut-theme directory:
> `sudo ln -s /home/$USER/.config/sddm-theme/pixel_onedark.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/pixel_onedark.conf`
> And 
> `sudo cp ~/.config/wallpapers/wallpaper-retro-onedark.png /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/`
> After that, edit the metadata.desktop file at this path:
> `sudo nano /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop`
> and edit the ConfigFile line so that it looks like this:
> ```ConfigFile=Themes/pixel_onedark.conf```

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
- <a href="/.config/picom">Picom</a>
- <a href="/.config/waybar">Waybar</a>
- <a href="/.config/wezterm">Wezterm</a>

## Acknowledgement
- [postylem/dotfiles](https://github.com/postylem/dotfiles-ARCHIVE)
- [wein1m/Windots](https://github.com/wein1m/Windots)
