;;; packages.el --- boogie-friends layer packages file for Spacemacs.
;;
;; Author:  <daniel@schoepe.org>
;; URL: https://github.com/dschoepe/spacemacs-boogie-friends
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst boogie-friends-packages
  '(boogie-friends))

(defun boogie-friends/init-boogie-friends ()
  (use-package boogie-friends
    :defer t
    :config
    (progn
      ;; Bindings for all modes
      (dolist (mode '(dafny-mode z3-smt2-mode boogie-mode))
        (spacemacs/set-leader-keys-for-major-mode mode "v"
          'boogie-friends-verify))
      ;; boogie-mode and dafny-mode
      (dolist (mode '(dafny-mode boogie-mode))
        (spacemacs/set-leader-keys-for-major-mode mode "t"
          'boogie-friends-trace)
        (spacemacs/set-leader-keys-for-major-mode mode "p"
          'boogie-friends-profile))
      ;; dafny-only:
      (spacemacs/set-leader-keys-for-major-mode 'dafny-mode "d"
      'dafny-docs-open)
      (spacemacs/set-leader-keys-for-major-mode 'dafny-mode "a"
      'boogie-friends-translate)
      (spacemacs/set-leader-keys-for-major-mode 'dafny-mode "j"
        'dafny-jump-to-boogie))))
