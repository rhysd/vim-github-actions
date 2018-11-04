" Vim indent file
" Language:   GitHub Actions Workflow
" Maintainer: rhysd <lin90162@yahoo.co.jp>
" License:    MIT Copyright (c) 2018 rhysd
" For bugs, patches and license go to https://github.com/rhysd/vim-github-actions

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal indentexpr=GetGHAWorkflowIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*GetGHAWorkflowIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

function GetGHAWorkflowIndent(lnum)
    let prevlnum = prevnonblank(a:lnum-1)
    if prevlnum == 0
        " Top of file
        return 0
    endif

    let prevl = getline(prevlnum)
    let thisl = getline(a:lnum)
    let ind = indent(prevlnum)

    " Increase indent
    if prevl =~# '[{[]\s*$'
        " Previous line opened a section body or array
        let ind += shiftwidth()
    endif

    " Decrease indent
    if thisl =~# '^\s*[}\]]'
        echom 'thisl: ' . thisl
        " this line closed a block
        let ind -= shiftwidth()
    endif

    return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

