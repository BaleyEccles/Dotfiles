(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Theme(s) ;;
(load-theme 'wheatgrass t)

;; Font ;;
(set-frame-font "Iosevka" nil t)

;; Line Numbers ;;
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Zoom ;;
(set-face-attribute 'default nil :height 200)

;; Packages ;;

;; auto-complete ;;
(require 'auto-complete)
(ac-config-default)

;; multiple-cursors ;;
(require 'multiple-cursors)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(ede-project-directories '("/home/baley/Projects/Advent-of-Code-2023"))
 '(package-selected-packages
   '(elisp-slime-nav auto-complete magit multiple-cursors sudo-edit org-modern)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Compile ;;
(global-set-key (kbd "C-c C-c") 'compile)

