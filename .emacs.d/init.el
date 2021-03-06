;; Init file
;; Erik Boström

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Disable startup screen
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(cua-mode t)

;; Set initial color theme
;;(load-theme 'misterioso)

;; Scroll bar
(set-scroll-bar-mode 'right)
(setq-default line-spacing 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages (quote (matlab-mode auctex)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))

;; Matlab mode
 (autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
 (setq matlab-indent-function t)
 (setq matlab-shell-command "matlab")

;; FreeFem mode
 (autoload 'freefem "freefem" "FreeFem++ mode" t)
 (add-to-list 'auto-mode-alist '("\\.edp$" . freefem))
 (add-to-list 'auto-mode-alist '("\\.idp$" . freefem))
