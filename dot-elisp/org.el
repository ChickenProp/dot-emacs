(add-to-list 'load-path "/home/phil/.elisp/org-mode/lisp")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-indent-indentation-per-level 1)
(setq org-M-RET-may-split-line nil)
(setq org-export-latex-inputenc-alist '(("utf8" . "utf8x")))

(add-hook 'org-mode-hook
	  (lambda ()
	    (visual-line-mode t)))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-file-apps '("pdf" . "epdfview %s"))
     (setq org-latex-to-pdf-process '("texi2dvi -b --dvipdf %f"))))

(when *on-gentoo*
  (require 'auto-complete)
  (add-to-list 'ac-modes 'org-mode)
)
