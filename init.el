;;; Personal .emacs.d for programming
;;; Want to try a more minimal Emacs and avoid using lsp in favor of basic autocomplete for faster development in large projects

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
;;(add-to-list 'default-frame-alist '(fullscreen . fullheight))
;;(setq default-frame-alist '((undecorated . t)))

;; Connect packages from MELPA archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Configure automatic package install
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t) ;; Every require will automatically install

;; Speedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
;; (global-set-key (kbd "C-c C-r") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
(sr-speedbar-refresh-turn-off)

;;; If some PKG is not found, just reload package repository
;; (use-package naysayer-theme)
(use-package ido-completing-read+)
(use-package smex)
(use-package rust-mode)
(use-package company)

(use-package tree-sitter)
(use-package tree-sitter-langs)

;; Fonts, themes
(set-frame-font "-outline-Source Code Pro-regular-normal-normal-mono-16-*-*-*-c-*-iso10646-1")
;;(load-theme 'naysayer t)

;; Emacs files.
(setq-default custom-file (concat user-emacs-directory ".init.custom.el"))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq create-lockfiles nil) 
(load-file custom-file)
(custom-set-variables
 '(compilation-disable-input t))

;; Ido to enable better matching (e.g. bk->(b)ac(k)up)
;; Smex to sort matches by recently used, replaces normal M-x
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) ;; Remember C-s C-r to navigate
(ido-ubiquitous-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(blink-cursor-mode 0)
;;(global-tree-sitter-mode)

;; Eglot for LSP
(setq eldoc-display-functions '(eldoc-display-in-buffer)) ;; only use dedicated buffer for info
(setq flymake-no-changes-timeout nil) ;; don't do diagnostics on edit
(setq flymake-start-on-flymake-mode nil)
(setq flymake-start-on-save-buffer nil)
(setq eglot-ignored-server-capabilities '(:inlayHintProvider)) ;; stop using minibuf
(setq eglot-report-progress nil)
(setq eglot-events-buffer-config '(size: nil))

(global-company-mode) ;; automatically setup by eg

;; Keybinds


;; (global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-o") 'previous-window-any-frame)
(global-set-key (kbd "M-p") 'next-window-any-frame)

(global-set-key (kbd "C-c C-r") 'xref-find-definitions)
(global-set-key (kbd "C-c C-e") 'xref-go-back)

(global-set-key (kbd "C-c c") (lambda () (interactive)
				;; save and recompile
				(progn (save-buffer) (recompile))))
(global-set-key (kbd "C-c C-x") (lambda () (interactive)(flymake-start t)))
(global-set-key (kbd "C-x C-c") nil) ;; disable close because it's easy to accidental tap
(global-set-key (kbd "C-\\") nil) ;; disable switching input method to prevent accidental lang change
;; (global-set-key (kbd "C-c d") 'dired-all)

;;;;; CUSTOM THEME


;;;;; DARK
(setq
 mince-bg1 "#161a1a"
 mince-fg1 "#aea294"
 mince-vars "#dacebd"
 mince-mid "#d0dddd"
 mince-fn "#dae9ea"
 mince-types "#69bac9"
 mince-comment "#84a9b4"
 mince-macro "#be786f"
 mince-string "#d9e5e5"
 mince-ml-fg "#b8b8b8"
 mince-ml-bg "#515151"
 mince-shadow "#4e5a63"
 mince-fringe "#161a1a"
 mince-minibuf "#1ea3df"
 mince-region "#6c6b68"
 mince-cursor "#998d7e"
 mince-parenmatch "#695f52"
 )

;;;; LIGHT
(setq
 mince-bg1 "#ffffff"
 mince-fg1 "#484848"
 mince-vars "#000000"
 mince-mid "#0049cd"
 mince-fn "#033236"
 mince-types "#841111"
 mince-comment "#9a8e8c"
 mince-macro "#0d6184"
 mince-string "#817d7d"
 mince-ml-fg "#ffffff"
 mince-ml-bg "#a35e5e"
 mince-shadow "#bbbbbb"
 mince-fringe "#e7e7e7"
 mince-minibuf "#9d2f2a"
 mince-region "#e2e2e2"
 mince-cursor "#000000"
 mince-parenmatch "#d8cfcf"
 )

(custom-set-faces
 ;; general
 `(default ((t (:foreground ,mince-fg1 :background ,mince-bg1))))
 `(font-lock-function-name-face ((t (:foreground ,mince-fn))))
 `(font-lock-builtin-face ((t (:foreground ,mince-fg1))))
 `(font-lock-constant-face ((t (:foreground ,mince-fg1))))
 `(font-lock-keyword-face ((t (:foreground ,mince-mid))))
 `(font-lock-type-face ((t (:foreground ,mince-types))))

 ;; string-comment-like
 `(font-lock-comment-face ((t (:foreground ,mince-comment))))
 `(font-lock-doc-face ((t (:foreground ,mince-comment))))
 `(rust-builtin-formatting-macro ((t (:foreground ,mince-macro))))
 `(rust-ampersand-face ((t (:foreground ,mince-mid))))
 `(font-lock-preprocessor-face ((t (:foreground ,mince-macro))))
 `(font-lock-string-face ((t (:foreground ,mince-string))))

 ;; cursor
 `(cursor ((t (:background ,mince-cursor))))
 `(region ((t (:background ,mince-region :foreground "black"))))
 `(show-paren-match ((t (:background ,mince-parenmatch))))
 
 `(font-lock-variable-name-face ((t (:foreground ,mince-vars))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 `(fringe ((t (:background ,mince-fringe))))
 `(minibuffer-prompt ((t (:foreground ,mince-minibuf :bold t))))
 `(mode-line ((t (:foreground ,mince-ml-fg :background ,mince-ml-bg))))
 
 '(secondary-selection ((t (:background "#111111"))))
 `(shadow ((t (:foreground ,mince-shadow))))

 ;; custom
 '(eglot-highlight-symbol-face ((t (:bold nil))))
 `(speedbar-selected-face ((t (:foreground ,mince-fn))))
 `(speedbar-file-face ((t (:foreground ,mince-comment))))
 )


