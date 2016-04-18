;;; packages.el --- org-page layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Paul Schorfheide <pschorf2@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-page-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-page/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-page/pre-init-PACKAGE' and/or
;;   `org-page/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-page-packages
  '(org-page)
)

;;; packages.el ends here
(defun org-page/init-org-page ()
  (spacemacs/declare-prefix "ab" "blog")
  (use-package org-page
    :config (progn (setq op/repository-directory "~/blog/blog"
                         op/site-main-title "Linus's Blog"
                         op/site-sub-title "A work in progress"
                         op/site-domain "https://linuus.github.io"
                         op/theme-root-directory "~/blog/"
                         op/theme 'org-page-theme-kactus
                         op/highlight-render 'htmlize
                         op/personal-github-link "http://github.com/linuus")
                   ;; op/personal-google-analytics-id "UA-XXXXXXXX-1")
                   (spacemacs/set-leader-keys
                     "abp" 'op/do-publication-and-preview-site
                     "abP" 'op/do-publication
                     "abn" 'op/new-post))))
