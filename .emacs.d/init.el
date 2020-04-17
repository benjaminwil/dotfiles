(defvar base-dir (file-name-directory load-file-name))

(setq inhibit-startup-screen t)
(setq custom-file (expand-file-name "custom.el" base-dir))
(setq backup-directory-alist `(("." . "~/.emacs.d/temp")))

(when (display-graphic-p)
  (load-theme 'deeper-blue))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(package-refresh-contents)

(setq package-list '(counsel
                    evil
                    ivy
                    projectile))

(dolist (pkg package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'evil)

(counsel-mode 1)
(evil-mode 1)
(global-display-line-numbers-mode 1)
(ivy-mode 1)
(show-paren-mode 1)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(projectile-mode +1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq show-paren-delay 0)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)

(when (eq system-type 'darwin)
 (load-file (expand-file-name "macos.el" base-dir)))
