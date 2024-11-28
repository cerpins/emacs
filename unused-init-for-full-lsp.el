;;; This is configuration with LSP, but it gives a lot of lisp errors/warnings, would like to fix or understand

(use-package lsp-ui
  :init
  ;; Eldoc
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-eldoc-render-all nil)
  ;; Signature
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-render-documentation nil)
  ;; Headerline
  (setq lsp-headerline-breadcrumb-enable t)
  ;; Lsp doc - we use 'lsp-describe-thing-at-point' instead
  (setq lsp-ui-doc-enable t)
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
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-symbol nil)
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
