(add-to-list 'load-path "/home/phil/.elisp/evil")
(require 'evil)

(setq evil-want-fine-undo t)

(evil-declare-motion 'mwheel-scroll)
(evil-declare-motion 'tex-file)
(evil-declare-motion 'tex-view)
(evil-declare-motion 'tex-buffer)

;; Undefine a bunch of keys from insert state.
(mapcar (lambda (key) (define-key evil-insert-state-map key nil))
	'("\C-k" "\C-e" "\C-y" "\C-r"))

(define-key evil-motion-state-map ";" (make-sparse-keymap))
(define-key evil-motion-state-map ";b" 'ido-switch-buffer)
(define-key evil-motion-state-map ";b" 'ido-switch-buffer)
(define-key evil-motion-state-map ";e" 'ido-find-file)
(define-key evil-motion-state-map ";w" 'save-buffer)
(define-key evil-motion-state-map ";q" 'evil-quit)
(define-key evil-motion-state-map ";k" 'kill-this-buffer)
(define-key evil-motion-state-map ";v" 'eval-last-sexp)
(define-key evil-motion-state-map "j" 'next-line)
(define-key evil-motion-state-map "k" 'previous-line)

(define-key evil-insert-state-map "\M-n" 'evil-execute-in-normal-state)

(evil-define-command my-evil-ido-buffer (buffer)
  "Switches to another buffer."
  :repeat nil
  (interactive "<b>")
  (if buffer
      (when (or (get-buffer buffer)
                (y-or-n-p (format "No buffer with name \"%s\" exists. Create new buffer? " buffer)))
        (switch-to-buffer buffer))
    (ido-switch-buffer)))

(evil-define-command my-evil-ido-edit (file)
  "Visits a certain file."
  :repeat nil
  (interactive "<f>")
  (if file
      (find-file file)
    (ido-find-file)))

(evil-ex-define-cmd "buffer" 'my-evil-ido-buffer)
(evil-ex-define-cmd "edit" 'my-evil-ido-edit)
(evil-ex-define-cmd "eval" 'eval-last-sexp)

(defadvice preceding-sexp (around evil)
  "In normal-state, last sexp ends at point."
  (if (evil-normal-state-p)
      (save-excursion
	(unless (or (eobp) (eolp)) (forward-char))
	ad-do-it)
    ad-do-it))

(defadvice pp-last-sexp (around evil)
  "In normal-state, last sexp ends at point."
  (if (evil-normal-state-p)
      (save-excursion
	(unless (or (eobp) (eolp)) (forward-char))
	ad-do-it)
    ad-do-it))

(evil-mode 1)
