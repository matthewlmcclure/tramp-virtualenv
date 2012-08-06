(require 'tramp)

(if (boundp 'enable-remote-dir-locals)
    (setq enable-remote-dir-locals t))

;; A workaround for http://debbugs.gnu.org/cgi/bugreport.cgi?bug=12145
(defadvice find-name-dired
  (around disable-remote-dir-locals-during-find-name-dired)
  (let ((enable-remote-dir-locals nil))
    ad-do-it))

(defun tramp-virtualenv (&optional dir)
  (if (or dir (boundp 'tramp-virtualenv-bin-directory))
      (progn
        (and dir (set (make-local-variable 'tramp-virtualenv-bin-directory) (concat dir "/bin")))
        (set (make-local-variable 'tramp-virtualenv-mode-line-string) (tramp-virtualenv-format-mode-line-string))
        (if (or (not (boundp 'tramp-virtualenv-last-bin-directory))
                (not (equal tramp-virtualenv-bin-directory tramp-virtualenv-last-bin-directory)))
            (progn
              (if (tramp-tramp-file-p (buffer-file-name))
                  (let* ((vec (tramp-dissect-file-name (buffer-file-name)))
                         (proc (tramp-get-connection-process vec))
                         (new-remote-path (let ((path (tramp-get-remote-path vec)))
                                            (setq path (delete tramp-virtualenv-bin-directory path))
                                            (add-to-list 'path tramp-virtualenv-bin-directory)
                                            path
                                            )))
                    (message "tramp-virtualenv remote")
                    (setq tramp-remote-path (delete tramp-virtualenv-bin-directory tramp-remote-path))
                    (add-to-list 'tramp-remote-path tramp-virtualenv-bin-directory)
                    (tramp-set-connection-property vec  "remote-path" new-remote-path)
                    (tramp-set-connection-property proc "remote-path" new-remote-path)
                    (tramp-set-remote-path vec))
                (progn
                  (message "tramp-virtualenv local")
                  (setq exec-path (delete tramp-virtualenv-bin-directory exec-path))
                  (add-to-list 'exec-path tramp-virtualenv-bin-directory)
                  (setenv "PATH" (mapconcat 'identity exec-path ":"))))
              (setq tramp-virtualenv-last-bin-directory tramp-virtualenv-bin-directory)
              (tramp-virtualenv-minor-mode t))))
    (tramp-virtualenv-minor-mode -1)))

(add-hook 'post-command-hook 'tramp-virtualenv)

(defun tramp-virtualenv-format-mode-line-string ()
  (concat " " (nth 1 (reverse (split-string tramp-virtualenv-bin-directory "/"))))
  )

(define-minor-mode tramp-virtualenv-minor-mode
  nil                                   ; use default docstring
  nil                                   ; the initial value
  tramp-virtualenv-mode-line-string     ; mode line indicator
  nil                                   ; keymap
  :group 'tramp-virtualenv)             ; group

(provide 'tramp-virtualenv)
