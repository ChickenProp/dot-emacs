; I don't actually like ac-l as much as standard ac.

;(add-to-list 'load-path "/home/phil/.elisp/auto-complete-latex")
;(require 'auto-complete-latex)
;(setq ac-l-dict-directory "/home/phil/.elisp/auto-complete-latex/ac-l-dict/")

(when *on-gentoo*
  (require 'auto-complete)
  (add-to-list 'ac-modes 'tex-mode)
  (add-to-list 'ac-modes 'latex-mode) ; Without latex as well, it doesn't start.
)

;; This is in fact provided by latex-insert-block, bound to C-c C-o.
(defun tex-wrap-environ (name point mark)
  (interactive
   (list
    (read-string "Environment: ")
    (point)
    (mark)))
  (let* ((open (concat "\\begin{" name "}"))
	 (close (concat "\\end{" name "}"))
	 (wrap (and mark mark-active))
	 (begin (if (or (not wrap) (< point mark))
		    point
		  mark))
	 (end (if (and wrap (< point mark))
		  mark
		point)))
    (save-excursion
      (goto-char end)
      (insert close)
      (goto-char begin)
      (insert open))
    (goto-char (+ point (length open)))))

(defun tex-insert-greek ()
  (interactive)
  (let* ((trans-map (let ((old-method current-input-method))
		      (prog2
			  (set-input-method "greek")
			  (quail-map)
			(set-input-method old-method))))
	 (key (read-key))
	 (translation (cadr (assoc key trans-map)))
	 (str (if (vectorp translation) (elt translation 0) translation)))
    (insert str)))


(defun tex-insert-fraction (num denom)
  (interactive
   (list
    (read-string "Numerator: ")
    (read-string "Denominator: ")))
  (insert (concat "\\frac{" num "}{" denom "}")))

(add-hook 'tex-mode-hook
	  (lambda ()
	    ;(ac-l-setup)
	    (visual-line-mode t)
	    (reftex-mode 1)
	    (define-key tex-mode-map (kbd "C-c f") 'tex-insert-fraction)
	    ;; Have one for the left hand, one for the right.
	    (define-key tex-mode-map (kbd "C-c u") 'tex-insert-greek)
	    (define-key tex-mode-map (kbd "C-c g") 'tex-insert-greek)))
