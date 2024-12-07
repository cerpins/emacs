(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/backup/")))
 '(compilation-disable-input t)
 '(custom-safe-themes
   '("5267955ef9a9e8bc64cadd113c1b15166c352ceb1798d18bab97e7892db5866f" "d46cb99f59fb858b11cac130f3a53688cc4323f3ec4aae80688bdd5d00312b91" default))
 '(package-selected-packages
   '(mince-theme smex rust-mode naysayer-theme ido-completing-read+ company))
 '(rust-always-locate-project-on-open t))

; how to make a good theme?
;; choose a good primary color for the 'default' foreground
;;; should be easy to tell apart when there's lots of it (contrast)
;;; should not be vibrant so it doesn't hurt to look at
;;; tl;dr - contrast but not vibrant

;; choose a background that makes the 'default' foreground contrasted
;;; background should not be too dark or it becomes vibrant

;; keywords - not sure, probably best to have something similar to foreground
;; but of a different tint? try it

;; choose a satured and light color for types
;; choose a satured and dim color for comments

;; macros and strings can be vibrant
