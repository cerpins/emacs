;;; Personal .emacs.d for programming
;;; Want to try a more minimal Emacs and avoid using lsp in favor of basic autocomplete for faster development in large projects

;; Connect packages from MELPA archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Configure automatic package install
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t) ;; Every require will automatically install

(use-package naysayer-theme)
(use-package ido-completing-read+)

;; Fonts, themes
(set-frame-font "-outline-Source Code Pro-regular-normal-normal-mono-16-*-*-*-c-*-iso10646-1")
(load-theme 'naysayer t)

;; No bell, topbar, menubar
(setq visible-bell 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Etc.
(desktop-save-mode 1)
(scroll-bar-mode 0)
(setq display-line-numbers-type 'visual)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)

;; Emacs files.
(setq custom-file (concat user-emacs-directory ".init.custom.el"))
(load-file custom-file)
(custom-set-variables
 '(backup-directory-alist '(("." . "~/.emacs.d/backup/")))
 '(compilation-disable-input t))

;; Ido to enable better matching (e.g. bk->(b)ac(k)up)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
