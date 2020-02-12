(package-initialize)
(require 'package)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(savehist-mode 1)
(desktop-save-mode 1)

(setq-default desktop-save t)
(setq-default desktop-auto-save-timeout 10)

(setq-default buffer-file-coding-system 'utf-8-unix)

(setq-default indent-tabs-mode nil)

(save-place-mode 1)
(setq save-place-forget-unreadable-files nil)

(global-auto-revert-mode t)

(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory)) (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))

(setq make-backup-files t)
(setq auto-save-default t)
(setq auto-save-timeout 45)

(setq auto-save-interval 300)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "firefox")

(setq-default fill-column 80)

(add-hook 'prog-mode-hook #'hs-minor-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-splash-screen t)

(require 'base16-theme)
(load-theme 'base16-default-dark t)
;;(load-theme 'base16-default-light t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-fringe-mode 0)

(add-to-list 'default-frame-alist '(font . "Liberation Mono-13" ))
(set-face-attribute 'default t :font "Liberation Mono-13" )

(blink-cursor-mode 0)

(setq scroll-step 1)
(setq scroll-conservatively  10000)
(setq auto-window-vscroll nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(show-paren-mode 1)

(add-hook 'prog-mode-hook 'linum-mode)

(require 'which-key)
(which-key-mode)

(require 'ein)

(setq ein:polymode t)

(require 'org)

(add-hook 'org-mode-hook 'org-display-inline-images)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)

(setq org-hide-emphasis-markers t)

(setq org-pretty-entities t)

(setq org-html-htmlize-output-type (quote css))

(setq org-cycle-separator-lines 0)

(setq org-agenda-files (list "~/org/agenda.org"))

(require 'ox-latex)

;; Change for beamer
;;(setq org-latex-pdf-process (list "latexmk -xelatex %f"))
(setq org-latex-pdf-process (list "latexmk -pdflatex='pdflatex' -pdf -f %f"))
(setq org-latex-default-packages-alist nil)
(setq org-latex-packages-alist (quote (("" "booktabs" t))))

(setq org-latex-listings t)
(add-to-list 'org-latex-classes
             '("org-elsarticle"
               "\\documentclass{elsarticle}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("org-ieeetran"
               "\\documentclass{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-export-async-init-file "~/.emacs.d/init.el")

(require 'ox-md)

(require 'ox-odt)

(setq org-edit-src-auto-save-idle-delay 5)
(setq org-edit-src-content-indentation 0)
(setq org-src-fontify-natively t)
(setq org-src-window-setup (quote other-frame))
(setq org-confirm-babel-evaluate nil)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist
             '("I" . "SRC emacs-lisp :tangle init.el"))
(add-to-list 'org-structure-template-alist
             '("S" . "SRC shell :results output :session *Shell*"))
(add-to-list 'org-structure-template-alist
             '("j" . "SRC jupyter-julia :results output :session jl :async yes"))
(add-to-list 'org-structure-template-alist
             '("p" . "SRC jupyter-python :results output :session py :async yes"))
(add-to-list 'org-structure-template-alist
             '("r" . "SRC R :results output :session *R*"))
(add-to-list 'org-structure-template-alist
             '("g" . "SRC R :results graphics output :session *R* :file (org-babel-temp-file \"figure\" \".png\") :width 800 :height 720"))

(require 'ob-julia)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (R . t)
   (julia . t)
   (python . t)
   (emacs-lisp . t)
   (shell . t)
   (ruby . t)
   (org . t)
   (makefile . t)
   (jupyter . t)
   ))

(require 'org-attach)
(setq org-link-abbrev-alist '(("att" . org-attach-expand-link)))

(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

(require 'ivy)
(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
