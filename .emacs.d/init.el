;;; init.el --- Emacs Initialization and Configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code: 

(setq gc-cons-threshold (* 512 1024 1024)
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 100 100 8)
                  gc-cons-percentage 0.1)))

(setq read-process-output-max (* 3 1024 1024))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)

(global-visual-line-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(column-number-mode 1)
(show-paren-mode 1)

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

;;; my old beloved themme ;-;
;;; (load-theme 'sexy t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;; Completions: 
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)          
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 1)
  (corfu-min-width 75)
  (corfu-max-width 100)
  (corfu-count 20)) 

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'")

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'"  "\\.tsx\\'"))

(use-package lsp-mode
  :hook ((c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (csharp-mode . lsp-deferred)
         (rust-mode . lsp-deferred)      
         (typescript-mode . lsp-deferred)
         (tsx-mode . lsp-deferred))  
  :commands lsp
  :config
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "--log=error" "--clang-tidy" "--enable-config"))
  (setq lsp-clangd-binary-path "/usr/bin/clangd"))

(setq lsp-log-io t)

;;; TODO: fix lsp csharp roslyn completions or change for csharp-ls
;;; Stolen from: https://github.com/blahgeek/emacs-lsp-booster/blob/master/README.md#configure-lsp-mode
(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
 (advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
 (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(use-package org)

(use-package ox-hugo
  :ensure t
  :after ox)

(use-package magit
  :ensure t)

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

;;; Thanks tsoding 
;;; Stolen from: https://github.com/rexim/dotfiles/blob/master/.emacs.rc/misc-rc.el
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

(defun xeno/buffer-file-name ()
  (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name)))

(defun xeno/kill-autoloads-buffers ()
  "kill autoloads buffer"
  (interactive)
    (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "-autoloads.el" name)
        (kill-buffer buffer)
        (message "Killed autoloads buffer %s" name)))))

(defun xeno/kill-scratch ()
  "kill scratch buffer"
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "*scratch*" name)
	(kill-buffer buffer)
	(message "Killed scratch buffer %s" name)))))

(defun xeno/kill-messages ()
  "kill messages buffer"
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "*Messages*" name)
	(kill-buffer buffer)
	(message "Killed messages buffer %s" name)))))

(defun xeno/kill-warnings ()
  "kill warnings buffer"
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "*Warnings*" name)
	(kill-buffer buffer)
	(message "Killed warnings buffer %s" name)))))

(defun xeno/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (xeno/buffer-file-name)))
    (when filename
      (kill-new filename)
      (message filename))))

(defun xeno/put-buffer-name-on-clipboard ()
  "Put the current buffer name on the clipboard"
  (interactive)
  (kill-new (buffer-name))
  (message (buffer-name)))

;; Org mode config
(setq org-directory "~/xeno/agenda/org/")

;; Org Agenda usage:
;; M-x org-agenda (or bind a key, e.g. C-c a)
;;
;; Inside the agenda view:
;;   t  -> change TODO state (TODO -> DOING -> WAITING -> DONE)
;;   ,  -> set priority (A/B/C)
;;   s  -> schedule the item for a date
;;   d  -> set a deadline
;;   r  -> refresh/reload the agenda
;;   q  -> quit

(setq org-agenda-files
      (list (concat org-directory "tasks.org")
	    (concat org-directory "notes.org")
	    (concat org-directory "journal.org")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-capture-templates
      `(("t" "Task" entry (file+headline ,(concat org-directory "tasks.org") "Inbox")
         "* TODO %?\n  %U\n  %a")
        ("n" "Note" entry (file ,(concat org-directory "notes.org"))
         "* %?\n  %U")
        ("j" "Journal" entry (file+datetree ,(concat org-directory "journal.org"))
         "* %U %?\n")))

(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)

(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-agenda-span 'week)
(setq org-agenda-start-on-weekday 1)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)

(setq org-priority-faces
      '((?A . (:foreground "#fb4934" :weight bold))
        (?B . (:foreground "#fabd2f"))
        (?C . (:foreground "#8ec07c"))))

;;; Keymaps: 
;;; C-c x d    → duplicate line
;;; C-c x f    → file name → clipboard
;;; C-c x b    → buffer name → clipboard
;;; C-c x k    → kill autoload buffers
;;; C-c x s    → kill scratch buffer
;;; C-c x m    → kill messages buffer
;;; C-c x w    → kill warnings buffer
;;; C-c c      → M-x compile bind

(define-prefix-command 'xeno/leader-map)

(global-set-key (kbd "C-c x") 'xeno/leader-map)

(define-key xeno/leader-map (kbd "d") #'xeno/duplicate-line)
(define-key xeno/leader-map (kbd "f") #'xeno/put-file-name-on-clipboard)
(define-key xeno/leader-map (kbd "b") #'xeno/put-buffer-name-on-clipboard)
(define-key xeno/leader-map (kbd "k") #'xeno/kill-autoloads-buffers)
(define-key xeno/leader-map (kbd "s") #'xeno/kill-scratch)
(define-key xeno/leader-map (kbd "m") #'xeno/kill-messages)
(define-key xeno/leader-map (kbd "w") #'xeno/kill-warnings)

(global-set-key (kbd "C-c c") 'compile)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(atom-one-dark-theme counsel gruvbox-theme hl-todo lsp-mode ox-hugo)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
