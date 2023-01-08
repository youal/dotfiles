(global-display-line-numbers-mode)
;; Unlike with Vim, relative numbers are a pain with folds in Emacs.
;; (setq display-line-numbers-type 'relative)

(set-face-attribute 'default (selected-frame) :height 250)

(setq org-hide-emphasis-markers t)

;; Replaces "-" and "*" by bullets in lists.
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; C-h k to check what a key does.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; To remap some keys
;; (with-eval-after-load 'evil-maps
;;   (define-key evil-motion-state-map (kbd "TAB") 'org-table-next-field))

(setq org-agenda-files (list "~/programming/orgmode.org"))


;; Hide bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; Ask "y" or "n" instead of "yes" or "no".
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))


;; Use straight as package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; Packages
(straight-use-package 'evil)
;; Enable Evil
;; Use "\" before pressing a key if the default behavious of Emacs is desired.
(require 'evil)
(evil-mode 1)

(straight-use-package 'magit)

(straight-use-package 'smartparens)
(require 'smartparens-config)

;; Bullets for headers
(straight-use-package 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(misterioso)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
