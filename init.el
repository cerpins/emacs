;;; package --- Summary
;;; Commentary:
;;; Code:

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless (fboundp 'package-activate-all) (package-initialize))

;; No top-bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Packages: This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; Packages: Auto-install packages
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Setup LSP
(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (global-set-key (kbd "C-c c") #'company-complete)
  (global-company-mode))

(use-package lsp-mode
  :commands (lsp-describe-thing-at-point)
  :config
  (setq lsp-keymap-prefix "C-c l")
  (global-set-key (kbd "C-c d") #'lsp-describe-thing-at-point) ;; Show doc at point
  (global-set-key (kbd "C-c g") #'goto-line) ;; Goto line
  (global-set-key (kbd "C-c /") #'comment-line) ;; Comment marked block
  

  ;;(setq lsp-enable-snippet nil)
  ;;:custom
  ;;(lsp-typescript-format-enable . nil)
  ;;(lsp-javascript-format-enable . nil)
  ;;(lsp-enable-on-type-formatting nil)
  ;;(lsp-html-format-enable . nil)
  ;;(lsp-html-format-content-unformatted . nil)
  :hook (
	 ;;(prog-mode . lsp)
	 (html-mode . lsp)
	 (rust-mode . lsp)
	 (typescript-ts-mode . lsp) ;; Not in use, but should be
	 (typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration) ;; enable which-key for showing key completion
	 (lsp-mode . display-line-numbers-mode)) ;; enable line numbers
  :commands (lsp))

(use-package lsp-ui
  :config
  ;; Eldoc
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-eldoc-render-all nil)
  ;; Signature
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  ;; Headerline
  (setq lsp-headerline-breadcrumb-enable t)
  ;; Lsp doc - Pretty annoying, we use 'lsp-describe-thing-at-point' instead
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  ;; Lens
  (setq lsp-lens-enable nil)
  ;; Modeline
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  ;; Sideline options
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-symbol t)
  :commands (lsp-ui-mode))
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))
(use-package flycheck
  :commands (flycheck-list-errors)
  :config
  (global-set-key (kbd "C-c e") #'flycheck-list-errors) ;; List flycheck errors
  (setq flycheck-display-errors-function nil)
  :init
  (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save idle-buffer-switch idle-change new-line mode-enabled)
      flycheck-idle-buffer-switch-delay 0))

;; Conflict resolution
(use-package smerge-mode)

;; Setup global syntax highlighting
(use-package tree-sitter-langs)
(use-package tree-sitter ;; TODO: Use inbuilt version 'treesit'?
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Setup TYPESCRIPT
(use-package typescript-mode)

;; Setup lang RUST
(use-package rust-mode)
;;  :init
;;  (setq lsp-inlay-hint-enable t))
;; todo: re-enable inlay hints t -- or nope

;; Setup lang TYPESCRIPT
;; lang-server used is ts-ls
;; typescript-ts-mode

;; Remember files
(desktop-save-mode 1)

;; Fonts
(set-frame-font "-outline-Source Code Pro-regular-normal-normal-mono-16-*-*-*-c-*-iso10646-1")


;; Themes
;; (eval-after-load "timu-macos"
;;  (customize-set-variable 'timu-macos-flavour "dark"))
;; (load-theme 'timu-macos t)
(add-to-list 'custom-theme-load-path "c:/Users/unoce/Documents/emacs")
(use-package naysayer-theme)
(load-theme 'naysayer t)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" default))
 '(lsp-html-format-content-unformatted nil)
 '(lsp-html-format-enable nil)
 '(package-selected-packages
   '(typescript-mode naysayer-theme zenburn-theme zenburn tree-sitter-langs tree-sitter flychecka flycheck which-key rust-mode lsp-ui lsp-treemacs company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

