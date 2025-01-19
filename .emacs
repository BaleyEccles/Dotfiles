;; melpa ;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; straight.el ;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)


;; Custom File ;;
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

;; Menu bar stuff ;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

;; Dashboard ;;
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "~/.config/emacs/org-mode-unicorn.svg")

;; Icons ;;
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(all-the-icons-ivy-setup)


;; Line Wrapping ;;
(setq word-wrap t)
(setq truncate-lines t)
(add-hook 'org-mode-hook 'visual-line-mode)

;; Theme ;;
(load-theme 'gruber-darker)
(set-frame-parameter nil 'alpha-background 88)
(add-to-list 'default-frame-alist '(alpha-background . 88))
(add-to-list 'default-frame-alist '(alpha 88 88))
(set-frame-parameter (selected-frame) 'alpha '(88 88))


;; Indent ;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)

;; Line Numbers ;;
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setq-default truncate-lines nil)

;; Font ;;
(add-to-list 'default-frame-alist '(font . "Iosevka-15"))

;; BINDS ;;
;; Compile ;;
(global-set-key (kbd "C-c c") 'compile)

;; Zoom ;;
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Kill when yanking ;;
(defun yank-and-replace-selection ()
  "Yank text, replacing the active region if any."
  (interactive)
  (when (use-region-p)
    (delete-region (region-beginning) (region-end)))
  (yank))

(global-set-key (kbd "C-y") 'yank-and-replace-selection)

;; ibuffer ;;
(global-set-key (kbd "C-x C-b") 'ibuffer-jump)

;; multiple-cursors ;;
(require 'multiple-cursors)
(custom-set-faces)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Persistant ;;
(straight-use-package 'prescient)

;; LSP ;;
;; lsp-mode ;;
;;(use-package lsp-mode
;;  :init
;;  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;  (setq lsp-keymap-prefix "C-c l")
;;  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;         (c++-mode     . lsp)
;;	     (c-mode       . lsp)
;;         (haskell-mode . lsp)
;;	     (latex-mode   . lsp)
;;         (lsp-mode     . lsp-enable-which-key-integration))
;;  :commands lsp)
;;;; lsp-ui ;;
;;(use-package lsp-ui :commands lsp-ui-mode)
;;;; lsp ivy ;;
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;;;; lsp which key ;;
;;;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))

;; eglot ;;
(require 'eglot)
;; c++ lsp ;;
(add-hook 'c++-mode-hook 'eglot-ensure)
(setq-default c-basic-offset 2)
(setq-default c++-basic-offset 2)
(define-key eglot-mode-map (kbd "C-c C-r") 'eglot-rename)
(define-key eglot-mode-map (kbd "C-c C-j") 'eglot-inlay-hints-mode)



;; prettier ;;
;(setenv "NODE_PATH" "/usr/lib/node_modules")
;(add-hook 'after-init-hook #'global-prettier-mode)

;; ivy ;;
(setq ivy-use-selectable-prompt t)
(setq ivy-use-virtual-buffers t)
(setq ivy-virtual-abbreviate 'abbreviate)
(setq enable-recursive-minibuffers t)
(setq prescient-filter-method '(literal regexp initialism))
(ivy-mode)
(counsel-mode 1)
(straight-use-package 'ivy-prescient)(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))
(setq prescient-sort-length-enable nil)
(setq ivy-prescient-enable-filtering 1)
(setq ivy-prescient-enable-sorting 1)
(prescient-persist-mode 1)
(ivy-rich-mode)

;; Company ;;
(company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(straight-use-package 'company-prescient)
(company-prescient-mode)
(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1))

;; Persistant Undo ;;
(undohist-initialize)

;; Org roam ;;
;; C-M-j
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/UTAS/org-roam/org-files")
  (org-roam-db-location "~/UTAS/org-roam/org-files/org-roam.db")
   (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n#+AUTHOR: Baley Eccles - 652137\n#+STARTUP: latexpreview\n* ${title}")
      :unnarrowed t)
     ("b" "pdf" plain
      (file "/home/Baley/UTAS/org-roam/org-files/templates/20240110195916-pdf_template.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n#+AUTHOR: Baley Eccles - 652137\n#+STARTUP: latexpreview\n#+LATEX_HEADER: \\usepackage[a4paper, margin=2.5cm]{geometry}\n#+LATEX_HEADER: \\usepackage{minted}\n#+LATEX_HEADER: \\usepackage{fontspec}\n#+LATEX_HEADER: \\setmonofont{Iosevka}\n#+LATEX_HEADER: \\setminted{fontsize=\\small, frame=single, bgcolor={HTML}{282c34}}\n#+LATEX_HEADER: \\usemintedstyle{one-dark}\n* ${title}"))))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n q" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode)
  (org-roam-setup))

;; Org babel ;;
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (python     . t)
   (octave     . t)))

(setq org-edit-src-content-indentation 0)

;; Org Mode ;;

(add-hook 'org-mode-hook 'org-indent-mode)

;; Org mode Latex ;;
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.9))

;; Org mode Latex previews ;;

(setq org-preview-latex-process-alist
      '((dvipng :programs
         ("latex" "dvipng")
         :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
         (1.0 . 1.0)
         :latex-compiler
         ("latex -interaction nonstopmode -output-directory %o %f")
         :image-converter
         ("dvipng -D %D -T tight -bg Transparent -o %O %f")
         :transparent-image-converter
         ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
 (dvisvgm :programs
          ("latex" "dvisvgm")
          :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
          (1.7 . 1.5)
          :latex-compiler
          ("latex -interaction nonstopmode -output-directory %o %f")
          :image-converter
          ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
 (imagemagick :programs
              ("latex" "convert")
              :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
              (1.0 . 1.0)
              :latex-compiler
              ("pdflatex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("magick -density %D -trim -transparent-color '#181818' -antialias %f -quality 100 %O"))))
(setq org-latex-preview-process 'dvipng)
(defun my/org-image-transparent-background ()
  "Add a transparent background to images in Org mode."
  (when (org-in-item-p)
    (let ((image (get-text-property (point) 'display)))
      (when (and image (imagep image))
        (let ((overlay (make-overlay (line-beginning-position) (line-end-position))))
          (overlay-put overlay 'face '(:background "unspecified-bg")))))))

(add-hook 'org-display-inline-images-hook 'my/org-image-transparent-background)
;; org xournalpp ;;
(straight-use-package
 '(org-xopp :type git :host github :repo "mahmoodsh36/org-xopp" :files (:defaults "*.sh")))
(with-eval-after-load 'org
  (require 'org-xopp)
  (org-xopp-setup))

;; Languages ;;
;; Octave ;;
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
;; Haskell ;;
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(put 'set-goal-column 'disabled nil)
