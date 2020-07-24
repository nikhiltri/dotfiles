;;; .emacs --- personal emacs configuration
;;
;; May 2017
;;
;; Author: nikhil trivedi <ntrivedi@artic.edu>
;; Version: 1.0.0

;;; Commentary:
;;
;; After numerous interations of configuring emacs with my daily workflow,
;; this is the simplest version I've brought things down to. As I work on
;; new projects, this may get more complicated again. But for now, this
;; does most of what I feel is useful.

;;; TO DO:
;;
;; Perhaps if I'm working with a new programming language that requires
;;   customizations, add them to a separate file that gets imported here.
;;   So I can remove the more experiemental customizations easily.

;;; Code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(php-cs-fixer editorconfig processing-mode yasnippet-snippets yasnippet multiple-cursors emojify ## web-mode-edit-element smart-tabs-mode project-explorer pbcopy markdown-preview-mode json-mode js2-mode flycheck f exec-path-from-shell drupal-mode auto-complete apib-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;; My customizations

;; Connect package manager to MELPA.org
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;; Show line-number in a left column buffer
(global-linum-mode 1)
(defvar linum-format)
(setq linum-format "%d  ")


;; Save backup files in separate directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)


;; Interactively do things (https://www.emacswiki.org/emacs/InteractivelyDoThings)
(require 'ido)
(ido-mode t)


;; Enables the kill-ring to interact with the clipboard (without losing full kill-ring functionality).
(turn-on-pbcopy)


;; Syntax auto-complete (https://github.com/auto-complete/auto-complete)
(ac-config-default)


;; Visualize whitespace
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-action
  '(auto-cleanup warn-read-only))
(setq whitespace-style
  '(face trailing tabs lines-tail indentation::space ))
(setq whitespace-line-column 80)


;; Use editorconfig on projects
(require 'editorconfig)
(editorconfig-mode 1)


;; Run PHP-CS-Fixer before saving PHP files
(require 'php-cs-fixer)
(add-hook 'before-save-hook 'php-cs-fixer-before-save)


;; Syntax checking (http://www.flycheck.org/en/latest/)
(require 'flycheck)
(global-flycheck-mode)
(add-hook 'flyspell-incorrect-hook
          #'(lambda (dummy1 dummy2 dymmy3)
              (and yas-active-field-overlay
                   (overlay-buffer yas-active-field-overlay))))

;; Use PHP mode in scratch buffer
(setq initial-major-mode 'php-mode)
(setq initial-scratch-message "\
// This buffer is for notes you don't want to save, and for PHP code.
// If you want to create a file, visit that file with C-x C-f,
// then enter the text in that file's own buffer.

")
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)


;; Add aliases for my own custom files
(add-to-list 'auto-mode-alist '("\.bash_.*\\'" . shell-script-mode))


;; Multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "M-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c l l") 'mc/mark-all-like-this)


;; Yas snippets
(yas-global-mode 1)


;; Explicitly set to use default bash shell
(setq-default shell-file-name "/bin/bash")


;; Add `drupal-mode` for Drupal exntesioned files
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))


;; Add Processing directives
(setq processing-location "/usr/local/bin/processing-java")
(setq processing-application-dir "/Applications/Processing\ 2.app")
(setq processing-sketchbook-dir "~/Documents/Processing")

(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary (append processing-functions
                                   processing-builtins
                                   processing-constants)))

(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)

;; Follow symlinks to a version controlled file
(setq vc-follow-symlinks t)


;;; .emacs ends here
