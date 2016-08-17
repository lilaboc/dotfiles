; font
(set-default-font "-outline-Monaco-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")

;; Disable welcome page
(setq inhibit-splash-screen t)

;; no toolbar
(tool-bar-mode -1)

;; no scrollbar
(toggle-scroll-bar -1)

;; display-line-num
(global-linum-mode 1)

;; recent opened files
(recentf-mode 1)

;; have line softly wrapped at line boundary
(global-visual-line-mode 1)

;; turn on paren match highlight
(show-paren-mode 1)
(setq show-paren-delay 0)
(global-hl-line-mode 1)

(column-number-mode 1)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; disable bell
;;(setq visible-bell t)
(custom-set-variables '(ring-bell-function 'ignore))

;; show buffer selection
(global-set-key (kbd "C-x C-b") 'bs-show)


;; package-install related
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
     (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
    (package-initialize) ;; You might already have this line

;; package-install auto-complete
(ac-config-default)


;; pakcage-install org-mode
