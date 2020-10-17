(use-package! exwm-config)
(use-package! exwm
  :init
  (setq exwm-layout-show-all-buffers t)
  (setq display-time-default-load-average nil)
  (setq exwm-input-line-mode-passthrough t)

  :config
  (display-time-mode t)
  (exwm-config-default)
  (exwm-enable))

(when (featurep 'ido-mode)
  (remove-hook! exwm-init-hook #'exwm-config-ido-buffer-window-other-frame
    ido-mode - 1))

(defvar exwm-app-launcher--prompt "$ "
  "Prompt for the EXWM application launcher")

(defun doom/exwm-application-launcher (command)
  "Launches an application in your PATH."
  (interactive (list (read-shell-command exwm-app-launcher--prompt)))
  (start-process-shell-command command nil command))

(exwm-input-set-key (kbd "s-p") #'doom/exwm-application-launcher)
