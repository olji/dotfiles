(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(setq inhibit-startup-screen t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(global-linum-mode t)
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
(load-theme 'ample t)
(require 'evil)
(evil-mode 1)

(smex-initialize)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "," 'execute-extended-command
  "." 'smex
  "b" 'buffer-menu
  "a" 'ff-find-other-file
  "'" 'smex-major-mode-commands)

(setq inferior-lisp-program "/bin/clisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)
(require 'helm-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(display-time-mode t)
 '(indicate-empty-lines t)
 '(package-selected-packages
   (quote
    (markdown-mode yaml-mode jekyll-modes evil-leader ample-theme smex slime helm evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
