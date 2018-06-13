;;; emacs setting file

;; site-lisp
(let ((default-directory
	(file-name-as-directory (concat user-emacs-directory "site-lisp"))))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; cursor blink
(blink-cursor-mode 0)

;; hilight line
;(global-hl-line-mode t)

;;
(show-paren-mode t)

;; package manager
(require 'package)
; melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; theme setting
 (load-theme 'wombat t)

;; disable making backup file
(setq make-backup-files nil)

;; change bakcup file directory
;;(setq backup-directory-alist '((".*" . ".emacs.d/backup")))

;; auto-save-buffers
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

;; linum
(require 'linum)
(defvar linum-line-number 0)
(declare-function linum-update-current "linum" ())
(defadvice linum-update-current
    (around linum-update-curren-around activate compile)
  (unless (= linum-line-number(line-number-at-pos))
    (setq linum-line-number (line-number-at-pos))
    ad-do-it))
(setq linum-format "%5d")
(global-linum-mode t)

;; mode line
(line-number-mode t)
(column-number-mode t)


;; pairence
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; backup
(setq delete-old-versions t)
(setq backup-inhibited nil)
(setq delete-auto-save-file nil)

;; auto reload
(global-auto-revert-mode t)
