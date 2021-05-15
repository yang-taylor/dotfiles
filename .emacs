(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; (require 'kaolin-themes)
;; (load-theme 'kaolin-aurora t)
(load-theme 'base16-cupcake t)
;; (load-theme 'base16-horizon-terminal-light t)
;; (load-theme 'base16-horizon-dark t)
;; (load-theme 'base16-paraiso t)
;; (load-theme 'base16-monokai t)
;; (load-theme 'base16-eighties t)
;; (load-theme 'base16-darktooth t)
;; (load-theme 'base16-summerfruit-dark t)
;; (load-theme 'base16-nord t)
;; (load-theme 'base16-material-palenight t)
;; (load-theme 'base16-material t)

(selectrum-mode +1)

(require 'evil) 
(evil-mode 1)

(require 'powerline)
(powerline-default-theme)
(nyan-mode)

(defvar my-linum-current-line-number 0)
(setq linum-format 'my-linum-relative-line-numbers)
(defun my-linum-relative-line-numbers (line-number)
  (let ((test2 (- line-number my-linum-current-line-number)))
    (propertize
     (number-to-string (cond ((<= test2 0) (* -1 test2))
                             ((> test2 0) test2)))
     'face 'linum)))
(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)
(global-linum-mode t)

;; (eval-after-load "tex"
;; 	'(add-to-list 'TeX-command-lilst
;; 		'("XeLaTeX" "xelatex -interaction=nonstopmode %s"
;;			TeX-run-command t t :help "Run xelatex") t))	



(add-to-list 'default-frame-alist
	'(font . "Iosevka-18"))

;; (defun insert-spaces () 
;; 	"insert a four spaces"
;; 	(interactive)
;; 	(insert "    "))
;; (global-set-key (kbd "TAB") 'insert-spaces)
;; (global-set-key (kbd "<tab>") 'insert-spaces)

(defun insert-tab () 
	"insert a tab character (ASCII 9, \t)"
	(interactive)
	(insert "\t"))
(global-set-key (kbd "TAB") 'insert-tab)
(global-set-key (kbd "<tab>") 'insert-tab)


(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq indent-tabs-mode t
                  indent-line-function 'indent-relative)))

(add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'reftex-mode-hook 'imenu-add-menubar-index)


(setq org-startup-folded t)
(setq org-todo-keyword-faces
	'(("ONGOING" . "#EC6A88")
		("TODO" . "#FBC3A7")
		("APPT" . "#FDF0ED")
		("DUE" . "#6BE6E6")
		("DONE" . "#3FDAA4")))
(setq org-todo-keywords
	'((sequence "TODO" "APPT" "|" "ONGOING" "DUE" "DONE")))

(require 'org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("⚡" "➞" "⤷" "≫"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(kaolin-themes selectrum powerline pdf-tools org-drill nyan-mode multiple-cursors markdown-mode magit evil base16-theme auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
