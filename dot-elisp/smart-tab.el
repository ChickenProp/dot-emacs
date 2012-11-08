;;;; Indentation in C mode uses tabs as far as the basic offset, then spaces
;;;  to go any further.
;;;  Source: http://bytes.inso.cc/wp/2009/01/07/dot-emacs-smarter-indentation-with-tabs-and-spaces/
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (add-hook 'c-special-indent-hook 'smart-tab-indent-hook)))
(defun get-nonempty-context ()
  (let ((curr-context (car (c-guess-basic-syntax))))
    (if (or (eq (car curr-context) 'arglist-intro)
            (eq (car curr-context) 'arglist-cont)
            (eq (car curr-context) 'arglist-cont-nonempty)
            (eq (car curr-context) 'arglist-close))
        curr-context
      nil)))

(defun smart-tab-indent-hook ()
  "Fixes indentation to pad with spaces in arglists."
  (let ((nonempty-ctx (get-nonempty-context)))
    (if nonempty-ctx
        (let ((tabbed-columns (+ (point-at-bol)
                                 (/ (c-langelem-col nonempty-ctx t)
                                    tab-width)))
              (orig-column (current-column)))
          (tabify (point-at-bol) tabbed-columns)
          (untabify tabbed-columns (point-at-eol))
          ; editing tabs screws the pointer position
          (move-to-column orig-column)))))
