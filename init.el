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

;;; If some PKG is not found, just reload package repository
(use-package naysayer-theme)
(use-package ido-completing-read+)
(use-package smex)
(use-package rust-mode)
(use-package company)

(use-package tree-sitter)
(use-package tree-sitter-langs)

;; Fonts, themes
(set-frame-font "-outline-Source Code Pro-regular-normal-normal-mono-16-*-*-*-c-*-iso10646-1")
;;(load-theme 'naysayer t)

;; No bell, topbar, menubar
(setq visible-bell 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Etc.
(desktop-save-mode 1)
(scroll-bar-mode 0)
(setq-default display-line-numbers-width 3)
(setq display-line-numbers-type 'visual)
;;(setq display-line-numbers-type t)
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
;;(global-tree-sitter-mode)

;; Eglot for LSP
(setq eldoc-display-functions '(eldoc-display-in-buffer)) ;; only use dedicated buffer for info
(setq flymake-no-changes-timeout nil) ;; don't do diagnostics on edit
(setq flymake-start-on-flymake-mode nil)
(setq flymake-start-on-save-buffer nil)
(setq eglot-ignored-server-capabilities '(:inlayHintProvider)) ;; stop using minibuf
;; Keybinds

(global-set-key (kbd "C-c c") (lambda () (interactive)
				 (progn (save-buffer)
					(recompile)))) ;; make it also save it with prog
(global-set-key (kbd "C-c C-x") (lambda () (interactive)(flymake-start t)))
;; (global-set-key (kbd "C-c d") 'dired-all)

;;;;; CUSTOM THEME

(setq
 mince-fg1 "#aea294"
 mince-vars "#dacebd"
 mince-mid "#d0dddd"
 mince-fn "#dae9ea"
 mince-bg2 "#00171f" ;; Better contrast in daylight
 mince-bg1 "#191b1b"
 mince-types "#69bac9"
 mince-comment "#84a9b4"
 mince-macro "#be786f"
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
 '(cursor ((t (:background "#998d7e"))))
 '(region ((t (:background "#6c6b68" :foreground "black"))))
 '(show-paren-match ((t (:background "#695f52"))))
 
 `(font-lock-variable-name-face ((t (:foreground ,mince-vars))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#3d3f3f"))))
 '(minibuffer-prompt ((t (:foreground "#1ea3df" :bold t))))
 '(mode-line ((t (:foreground "#b8b8b8" :background "#515151"))))
 '(rust-ampersand-face ((t (:foreground "#b8c6c6"))))
 
 '(secondary-selection ((t (:background "#111111"))))
 '(shadow ((t (:foreground "#4e5a63"))))

 ;; custom
 '(eglot-highlight-symbol-face ((t (:bold nil))))
 )


