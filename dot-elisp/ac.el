; Currently broken on mac: requires popup.  I think that needs a git
; submodule clone, but the proxy will screw that up because it doesn't
; use the SSH url.

(when *on-gentoo*
  (add-to-list 'load-path "~/.elisp/includes/auto-complete")
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories
	       "~/.elisp/auto-complete/ac-dict")
  (ac-config-default)

  (define-key ac-completing-map [down] nil)
  (define-key ac-completing-map [up] nil)
  (define-key ac-complete-mode-map [tab] 'ac-expand)
)

; Stop it complaining when we add things to this.
(when *on-osx*
  (defvar ac-modes 'nil))
