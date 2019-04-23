;;; lsp-clojure.el --- Clojure support for lsp-mode

;;; Commentary:

;;; Code:
(require 'lsp-mode)

(defun lsp-clojure-move-to-let (binding-name)
  "Move form at point into nearest existing let binding as BINDING-NAME."
  (interactive "MBinding name: ") ;; Name of the let binding
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "move-to-let"
   (list (concat "file://" buffer-file-name)
         (- (line-number-at-pos) 1) ;; clojure-lsp expects line numbers to start at 0
         (current-column)
         binding-name)))

(defun lsp-clojure-introduce-let (binding-name)
  "Move form at point into a new let binding as BINDING-NAME."
  (interactive "MBinding name: ") ;; Name of the let binding
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "introduce-let"
   (list (concat "file://" buffer-file-name)
         (- (line-number-at-pos) 1) ;; clojure-lsp expects line numbers to start at 0
         (current-column)
         binding-name)))

(defun lsp-clojure-thread-first-all ()
  "Apply thread-first-all refactoring at point."
  (interactive)
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "thread-first-all"
   (list (concat "file://" buffer-file-name)
         (- (line-number-at-pos) 1) ;; clojure-lsp expects line numbers to start at 0
         (current-column))))

(defun lsp-clojure-thread-last-all ()
  "Apply thread-last-all refactoring at point."
  (interactive)
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "thread-last-all"
   (list (concat "file://" buffer-file-name)
         (- (line-number-at-pos) 1) ;; clojure-lsp expects line numbers to start at 0
         (current-column))))

(defun lsp-clojure-add-missing-libspec ()
  "Apply add-missing-libspec refactoring at point."
  (interactive)
  (lsp--cur-workspace-check)
  (lsp--send-execute-command
   "add-missing-libspec"
   (list (concat "file://" buffer-file-name)
         (- (line-number-at-pos) 1) ;; clojure-lsp expects line numbers to start at 0
         (current-column))))

(provide 'lsp-clojure)
;;; lsp-clojure.el ends here
