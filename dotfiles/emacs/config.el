;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Lucas"
      user-mail-address "")

;; UI
(setq doom-theme 'doom-one)
(setq display-line-numbers-type nil)
(setq org-directory (expand-file-name "org" (or (getenv "XDG_ORG_DIR") (getenv "HOME"))))
(setq org-hide-emphasis-markers t
      org-ellipsis " ▾")

;; Org basics
(after! org
  (setq org-agenda-files (list (expand-file-name "agenda" org-directory))
        org-default-notes-file (expand-file-name "inbox.org" org-directory)
        org-log-done 'time
        org-download-image-dir (expand-file-name "media" org-directory)
        org-download-heading-lvl nil)
  (setq org-capture-templates
        '(("i" "Inbox" entry (file org-default-notes-file)
           "* TODO %?\n  %U"))))

;; Denote for simple note workflow
(use-package! denote
  :init
  (setq denote-directory org-directory
        denote-known-keywords '("note" "journal" "idea")
        denote-sort-keywords t
        denote-infer-keywords t
        denote-excluded-directories-regexp (rx (or "media")))
  :config
  (add-hook 'dired-mode-hook #'denote-dired-mode))

;; Minimal leader keybindings similar to your Neovim setup
(map! :leader
      (:prefix ("n" . "notes")
       :desc "New note"        "n" #'denote
       :desc "Find note"       "f" #'denote-find
       :desc "Link to note"    "l" #'denote-link
       :desc "Search notes"    "s" #'denote-rename-file-using-front-matter
       :desc "Capture TODO"    "t" (cmd! (org-capture nil "i"))))

;; Disable coding features in Doom UI where possible
(after! company (global-company-mode -1))
(after! lsp-mode (global-lsp-mode -1))
(after! flycheck (global-flycheck-mode -1))



