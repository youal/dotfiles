(when (version<= "26.0.50" emacs-version )
    (global-display-line-numbers-mode)
    (setq auto-mode-alist (cons '("\\.rkt$" . racket-mode)
				auto-mode-alist)))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     t)

;(add-hook 'racket-mode-hook #'smartparens-mode)
(add-hook 'racket-mode-hook #'evil-mode)
(add-hook 'fundamental-mode-hook #'evil-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-mode)
;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (smartparens paredit racket-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
