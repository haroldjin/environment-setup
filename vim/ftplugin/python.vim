" Let ALE engine use linters and fixers for python project

" Check Python files with flake8.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8.
let b:ale_fixers = ['autopep8']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
