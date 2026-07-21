;;; init.el --- Emacs Initialization and Configuration
;;; Commentary:
;;; Code: 

(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(column-number-mode 1)
(show-paren-mode 1)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

;; (load-theme 'sexy t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)


(use-package org)

(use-package ox-hugo
  :ensure t
  :after ox)

;; TODO: Fix autoload
(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#fabd2f")
          ("FIXME"  . "#fb4934")
          ("HACK"   . "#fe8019")
          ("NOTE"   . "#83a598")
          ("BUG"    . "#fb4934")
          ("XXX"    . "#d3869b")
          ("REVIEW" . "#b8bb26")
          ("DEPRECATED" . "#928374")))
  (global-hl-todo-mode))

(use-package ivy
  :ensure t
  :defer 0
  :config
  (ivy-mode 1)

  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        enable-recursive-minibuffers t))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper-isearch)))

;; Thanks tsoding 
(defun xeno/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(if s (string-remove-suffix "\n" s) "")))
  (move-end-of-line 1)
  (newline)
  (insert line)
  (move-beginning-of-line 1)
  (foward-char column))

(defun xeno/kill-autoloads-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "-autoloads.el" name)
	(kill-buffer buffer)
	(message "Killed autoloads buffer %s" name)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
