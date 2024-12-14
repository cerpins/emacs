;;; mince-theme.el --- mince
;;; Version: 1.0
;;; Commentary:
;;; A theme called mince
;;; Code:

(deftheme mince "DOCSTRING for mince")

(custom-theme-set-faces 'mince
			'(default ((t (:foreground "#929496" :background "#101113"))))
			'(cursor ((t (:background "#8ea1ad"))))
			'(font-lock-builtin-face ((t (:foreground "#5b5d60"))))
			'(font-lock-comment-face ((t (:foreground "#9e9972"))))
			'(font-lock-constant-face ((t (:foreground "#b8c6c6"))))
			'(font-lock-doc-face ((t (:foreground "#9e9972"))))
			'(font-lock-function-name-face ((t (:foreground "#929496"))))
			'(font-lock-keyword-face ((t (:foreground "#bebfc0"))))
			'(font-lock-preprocessor-face ((t (:foreground "#e5edf1"))))
			'(font-lock-string-face ((t (:foreground "#b9b98d"))))
			'(font-lock-type-face ((t (:foreground "#69bac9"))))
			'(font-lock-variable-name-face ((t (:foreground "#bebfc0"))))
			'(font-lock-warning-face ((t (:foreground "red" :bold t))))
			'(fringe ((t (:background "#3d3f3f"))))
			'(minibuffer-prompt ((t (:foreground "#1ea3df" :bold t))))
			'(mode-line ((t (:foreground "#b8b8b8" :background "#515151"))))
			'(region ((t (:background "#3c3c3c"))))
			'(rust-ampersand-face ((t (:foreground "#b8c6c6"))))
			'(secondary-selection ((t (:background "#111111"))))
			'(shadow ((t (:foreground "#4e5a63"))))
			)


;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'mince)

;;; mince-theme.el ends here
