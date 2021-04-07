(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (load-theme 'base16-cupcake t)
;; (load-theme 'base16-horizon-terminal-light t)
;; (load-theme 'base16-horizon-dark t)
;; (load-theme 'base16-paraiso t)
;; (load-theme 'base16-monokai t)
;; (load-theme 'base16-eighties t)
;; (load-theme 'base16-darktooth t)
;; (load-theme 'base16-summerfruit-dark t)
;; (load-theme 'base16-nord t)
(load-theme 'base16-material-palenight t)
;; (load-theme 'base16-material t)

(selectrum-mode +1)

(require 'evil) 
(evil-mode 1)

(require 'powerline)
(powerline-default-theme)
(nyan-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)



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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-open-quote "\"")
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(pdf-tools latex-preview-pane ivy ein flyspell-correct-popup live-py-mode ac-html better-defaults lsp-javacomp nyan-mode powerline forge treemacs elpy math-preview multiple-cursors auto-complete selectrum magit base16-theme polymode org markdown-mode evil company-math auctex)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-level-1 ((t (:foreground "#B877DB"))))
;;  '(org-level-2 ((t (:foreground "#26BBD9"))))
;;  '(org-level-3 ((t (:foreground "#FAB795"))))
;;  '(org-level-4 ((t (:foreground "#6C6F93")))))

;; (require 'lsp-javacomp)
;; (add-hook 'java-mode-hook #'lsp-javacomp-enable)

;; (add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
