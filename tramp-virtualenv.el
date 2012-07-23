(require 'tramp)

(if (boundp 'enable-remote-dir-locals)
    (setq enable-remote-dir-locals t))

(defun tve-update-remote-path (&optional dir)
  (and (tramp-tramp-file-p (buffer-file-name))
       (progn
         (or (boundp 'tve-bin-directory) (set (make-local-variable 'tve-bin-directory) dir))
         (or (equal tve-bin-directory (car tramp-remote-path))
             (let* ((vec (tramp-dissect-file-name (buffer-file-name)))
                    (proc (tramp-get-connection-process vec))
                    (old-remote-path (tramp-get-remote-path vec))
                    (new-remote-path (let ((new-remote-path old-remote-path))
                                       (setq new-remote-path (delq tve-bin-directory new-remote-path))
                                       (add-to-list 'old-remote-path tve-bin-directory))))
               (setq tramp-remote-path (delq tve-bin-directory tramp-remote-path))
               (add-to-list 'tramp-remote-path tve-bin-directory)
               (tramp-set-connection-property vec  "remote-path" new-remote-path)
               (tramp-set-connection-property proc "remote-path" new-remote-path)
               (tramp-set-remote-path vec)
               )))))

(add-hook 'post-command-hook 'tve-update-remote-path)
