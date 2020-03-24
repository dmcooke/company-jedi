# company-jedi.el

[![melpa badge][melpa-badge]][melpa-link]
[![melpa stable badge][melpa-stable-badge]][melpa-stable-link]
[![circleci badge][circleci-badge]][circleci-link]

`company-mode` completion back-end for Python JEDI.

## Installation

`company-jedi` is available on [MELPA](https://melpa.org).

You can install `company-jedi` with the following command.

<kbd>M-x package-install [RET] company-jedi [RET]</kbd>

**Please do not install jedi package for company users, it is an [auto-complete](https://github.com/auto-complete/auto-complete) plugin of jedi**

#### For el-get users

```lisp
(el-get-bundle elpa:jedi-core)
(el-get-bundle company-jedi :depends (company-mode))
```

## Setup

```el
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
```

[melpa-link]: https://melpa.org/#/company-jedi
[melpa-stable-link]: https://stable.melpa.org/#/company-jedi
[circleci-link]: https://app.circleci.com/pipelines/github/emacsorphanage/company-jedi
[melpa-badge]: https://melpa.org/packages/company-jedi-badge.svg
[melpa-stable-badge]: https://stable.melpa.org/packages/company-jedi-badge.svg
[circleci-badge]: https://img.shields.io/circleci/project/github/emacsorphanage/company-jedi.svg
