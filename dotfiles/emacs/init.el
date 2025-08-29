;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(doom! :input
       ;; no special input modules

       :completion
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       hl-todo
       (modeline +light)
       nav-flash
       ophints
       (popup +defaults)
       unicode
       vc-gutter
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       snippets
       fold

       :emacs
       dired
       (ibuffer +icons)
       undo

       :term
       vterm

       :checkers
       ;; disabled for note-taking

       :tools
       (eval +overlay)
       (lookup +dictionary +docsets)
       magit

       :os
       (:if IS-LINUX tty)

       :lang
       (org +pretty)

       :email
       ;; none

       :app
       (rss +org)

       :config
       (default +bindings +smartparens))



