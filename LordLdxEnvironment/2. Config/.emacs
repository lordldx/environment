;;; Enable syntax highlighting
(global-font-lock-mode 1)

(setq telnet-program "telnet")
(setq-default tab-width 2)                      ;; default tabstop
(setq-default indent-tabs-mode nil)     ;; tabs -> spaces
(setq-default auto-save-default nil)    ;; disable autosaving
(setq-default make-backup-files nil)     ;; disable backup files
(set-background-color "black")
(set-foreground-color "grey")
(set-cursor-color "green")
(setq-default ediff-split-window-function 'split-window-horizontally)

;; extra loadpaths
(put 'upcase-region 'disabled nil)

(defun start-of-next-defun ()
  "goes to the opening parenthese of the next function"
  (interactive)
  (end-of-defun)
  (end-of-defun)
  (beginning-of-defun))

(defun style-me ()
  "Indents the complete file according to the current set tab-width"
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun output-to-minibuffer (output)
  (save-window-excursion
    (select-window (minibuffer-window))
    (goto-char (point-max))
    (insert output)))

(defun multi-down-paste (numlines)
  (interactive "nNumberOfLines: ")
  (setq idx '0)
  (while (< idx numlines)
    (yank (universal-argument))
    (next-line '1)
    (+ idx '1)))

(defun find-in-files (search-string)
  (interactive "sSearchString: ")
  (shell-command (concat "fgrep -rn " (concat search-string " *"))))

(defun get-current-line-number ()
  (+ (count-lines (point-min)(point))
     (if (= (current-column) 0) 1 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML-ification functions
(defun html-italicize-word ()
  "Toggles html-italic tags of the word at point."
  (interactive)
  (save-excursion
    (skip-chars-backward "[[:alnum:]_()]")
    (insert "<i>")
    (skip-chars-forward "[[:alnum:]_()]")
    (insert "</i>")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VB.NET mode
(autoload 'vbnet-mode "vbnet-mode" "Visual Basic .NET mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" . vbnet-mode)) auto-mode-alist))

;; adjust indentation
(setq vbnet-mode-indent 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML helper mode
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML." t)
;(setq auto-mode-alist (append '(("\\.\\(asp\\|aspx\\|html\\|htm\\|xhtml\\)$" . html-helper-mode)) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Perl mode

;; use alternate perl mode
(defalias 'perl-mode 'cperl-mode)

;; Enable all the nifty features of CPerl mode
(setq cperl-hairy t)

;; Enable font-lock and shebang modes in perl buffers
(add-hook 'cperl-mode-hook '(lambda nil
                              (progn
                                (font-lock-mode 1))))

(setq auto-mode-alist (append '(("\\.[pP][lLmM]]$" . perl-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.t$" . perl-mode)) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Snippets
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "C:\\emacs\\site-lisp\\yasnippet\\snippets")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C# mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YAML mode
(autoload 'yaml-mode "yaml-mode" "Major mode for editing YAML code." t)
(setq auto-mode-alist
      (append '(("\\.\\(yml\\|yaml\\)$" . yaml-mode)) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; General customizations
;; don't show that ugly toolbar
(tool-bar-mode -1)

;; Replace "yes or no" with y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key bindings
(global-set-key "\C-cy" 'start-of-next-defun)
(global-set-key "\C-cf" 'find-in-files)
(global-set-key "\M-p" 'dabbrev-expand)
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-cc" 'calculator)
(global-set-key "\C-chi" 'html-italicize-word)
(global-set-key "\M-s" 'scroll-lock-mode)
(define-key ctl-x-map "c" 'compile)
(define-key ctl-x-map "\C-e" 'next-error)
(define-key ctl-x-map "r" 'toggle-read-only)
(define-key ctl-x-map "tt" 'insert-tt-block)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gdb-many-windows t)
 '(inhibit-splash-screen t)
 '(mouse-wheel-scroll-amount (quote (1)))
 '(safe-local-variable-values (quote ((c-indentation-style . bsd))))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
