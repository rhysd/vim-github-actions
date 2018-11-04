" Vim filetype detection file
" Language:   GitHub Actions Workflow
" Maintainer: rhysd <lin90162@yahoo.co.jp>
" License:    MIT Copyright (c) 2018 rhysd
" For bugs, patches and license go to https://github.com/rhysd/vim-github-actions

autocmd BufNewFile,BufReadPost .github/*.workflow setlocal filetype=ghaworkflow
