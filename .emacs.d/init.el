;;; init.el --- Emacs Initialization and Configuration
;;; Commentary:
;;; Code: 

(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(column-number-mode 1)
(show-paren-mode 1)

(load-theme 'sexy t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
