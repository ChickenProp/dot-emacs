(ido-mode)
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-delay-time 99999)

(setq-default show-trailing-whitespace t)

(add-to-list 'load-path "/home/phil/local/share/emacs")
(eval-after-load "slime"
  '(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl"))))

(autoload 'javacc-mode "javacc-mode")

(mapcar (lambda (x) (add-to-list 'auto-mode-alist x))
	'(("\\.jj$" . javacc-mode)
	  ("\\.jjt$" . javacc-mode)
	  ("\\.as$" . actionscript-mode)
	  ("SConstruct" . python-mode)
	  ("\\.hx$" . haxe-mode)))

(add-to-list 'ac-modes 'actionscript-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-to-list 'load-path "/home/phil/.elisp/ace-jump-mode")
(require 'ace-jump-mode)
(define-key evil-motion-state-map (kbd "g c") 'ace-jump-word-mode)
(define-key evil-motion-state-map (kbd "g r") 'ace-jump-char-mode)
(define-key evil-motion-state-map (kbd "g l") 'ace-jump-line-mode)
(mapcar (lambda (fn) (evil-declare-motion fn))
	'(ace-jump-mode
	  ace-jump-char-mode
	  ace-jump-word-mode
	  ace-jump-line-mode))

(add-to-list 'ac-modes 'haxe-mode)

(defun flashpunk-insert-headers ()
  (interactive)
  (let ((name (file-name-sans-extension
	       (file-name-nondirectory (buffer-file-name)))))
    (insert "package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class ")
    (insert name)
    (insert " extends ")
    (save-excursion
      (insert " {
	public function ")
      (insert name)
      (insert " () {
	}
}
}
"))))
