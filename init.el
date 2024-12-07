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
(use-package smex)
(use-package rust-mode)
(use-package company)

;; Fonts, themes
;;(package-install-file "~/.emacs.d/mince-theme.el")
(set-frame-font "-outline-Source Code Pro-regular-normal-normal-mono-16-*-*-*-c-*-iso10646-1")
;;(load-theme 'naysayer t)
;;(load-theme 'mince t)

;; No bell, topbar, menubar
(setq visible-bell 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Etc.
(desktop-save-mode 1)
(scroll-bar-mode 0)
(setq-default display-line-numbers-width 3)
(setq display-line-numbers-type 'visual)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)

;; Emacs files.
(setq-default custom-file (concat user-emacs-directory ".init.custom.el"))
(load-file custom-file)
(custom-set-variables
 '(backup-directory-alist '(("." . "~/.emacs.d/backup/")))
 '(compilation-disable-input t))

;; Ido to enable better matching (e.g. bk->(b)ac(k)up)
;; Smex to sort matches by recently used, replaces normal M-x
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(blink-cursor-mode 0)
(global-company-mode)

;; Keybinds

(global-set-key (kbd "C-c c") 'recompile)
;; (global-set-key (kbd "C-c d") 'dired-all)




;;;;; CUSTOM THEME

(setq
 mince-fg1 "#aea294"
 mince-vars "#a5bbbf"
 mince-mid "#dae9ea"
 mince-fn "#dae9ea"
 mince-bg1 "#191b1b"
 mince-types "#69bac9"
 mince-comment "#628790"
 mince-macro "#a16e55"
 mince-string "#d9e5e5"
 )


(custom-set-faces
 ;; general
 `(default ((t (:foreground ,mince-fg1  :background ,mince-bg1))))
 `(font-lock-function-name-face ((t (:foreground ,mince-fn))))
 `(font-lock-builtin-face ((t (:foreground ,mince-fg1))))
 `(font-lock-constant-face ((t (:foreground ,mince-fg1))))
 `(font-lock-keyword-face ((t (:foreground ,mince-mid))))
 `(font-lock-type-face ((t (:foreground ,mince-types))))
 
 ;; string-comment-like
 `(font-lock-comment-face ((t (:foreground ,mince-comment))))
 `(font-lock-doc-face ((t (:foreground ,mince-comment))))
 `(rust-builtin-formatting-macro ((t (:foreground ,mince-macro))))
 `(font-lock-preprocessor-face ((t (:foreground ,mince-macro))))
 `(font-lock-string-face ((t (:foreground ,mince-string))))

 ;; cursor
 '(cursor ((t (:background "#8ea1ad"))))

 `(font-lock-variable-name-face ((t (:foreground ,mince-vars))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#3d3f3f"))))
 '(minibuffer-prompt ((t (:foreground "#1ea3df" :bold t))))
 '(mode-line ((t (:foreground "#b8b8b8" :background "#515151"))))
 '(region ((t (:background "#3c3c3c"))))
 '(rust-ampersand-face ((t (:foreground "#b8c6c6"))))
 
 '(secondary-selection ((t (:background "#111111"))))
 '(shadow ((t (:foreground "#4e5a63"))))
 '(show-paren-match ((t (:background nil))))
 )


