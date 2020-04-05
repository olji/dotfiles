(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Bootstrap Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

; Variable settings 
(setq inhibit-startup-screen t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq visible-bell t)
(setq path-to-ctags "/bin/ctags")

(setq initial-buffer-choice "~/project/")

(global-linum-mode t)
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))

; Configure packages

(use-package fic-mode
  :config
  (fic-mode 1))

(use-package ample-theme
  :config
  (load-theme 'ample t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package magit)
(use-package evil-magit
  :config
  (evil-magit-init))

; Key bindings
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
  "," 'execute-extended-command
  "." 'smex
  "b" 'buffer-menu
  "t" 'shell-pop
  "g" 'magit
  "a" 'ff-find-other-file
  "s" 'comment-region
  "u" 'uncomment-region
  "'" 'smex-major-mode-commands))

(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("shell" "*shell*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/bash")
  (shell-pop--set-shell-type '-shell-pop-shell-type shell-pop-shell-type))

(use-package gnus
  :config
  (with-eval-after-load 'gnus
    (define-key gnus-group-mode-map (kbd "j") 'evil-next-line)
    (define-key gnus-group-mode-map (kbd "k") 'evil-previous-line)))

(use-package smex
  :config
  (smex-initialize))

(use-package slime
  :config
  (slime-setup))

(setq inferior-lisp-program "/bin/clisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")

; Functions
(defun create-tags (dir)
  "Create tags file"
  (interactive "DDirectory: ")
  (shell-command 
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir))))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(display-time-mode t)
 '(indicate-empty-lines t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (org-wiki shell-pop evil-magit magit fic-mode evil-collection notmuch markdown-mode yaml-mode jekyll-modes evil-leader ample-theme smex slime helm evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
