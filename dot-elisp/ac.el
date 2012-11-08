(add-to-list 'load-path "/home/phil/.elisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "/home/phil/.elisp/auto-complete/ac-dict")
(ac-config-default)

(define-key ac-completing-map [down] nil)
(define-key ac-completing-map [up] nil)
(define-key ac-complete-mode-map [tab] 'ac-expand)
