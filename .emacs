; General
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-q") 'kill-emacs)
(global-set-key (kbd "C-w") 'kill-buffer)
(global-set-key (kbd "C-x") 'cua-cut-region)

; Windows
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "M-2") 'split-window-horizontally)
(global-set-key (kbd "M-0") 'split-window-vertically) 

; Search
(global-set-key (kbd "C-f") 'isearch-forward)

; Edit
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "TAB") 'self-insert-command)

; Settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(cua-mode t)
(setq standard-indent 4)
(setq indent-tabs-mode t)

; Theming
(setq inhibit-startup-screen t)
(setq linum-format " %05d ")
(setq indent-tabs-mode t)
(setq tab-width 4)

(set-face-attribute 'default nil :font "Iosevka")

(custom-set-variables '(custom-enabled-themes (quote (wombat)))
                      '(ido-mode (quote file) nil (ido)))q
