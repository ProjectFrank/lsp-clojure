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

(provide 'lsp-clojure)
;;; lsp-clojure.el ends here
