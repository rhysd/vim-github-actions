" Vim syntax file
" Language:   GitHub Actions Workflow
" Maintainer: rhysd <lin90162@yahoo.co.jp>
" License:    MIT Copyright (c) 2018 rhysd
" For bugs, patches and license go to https://github.com/rhysd/vim-github-actions

" Note: Official work flow documentation:
"   https://developer.github.com/actions/creating-workflows/workflow-configuration-options/

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn cluster ghaworkflowBlock contains=ghaworkflowBlockKind,ghaworkflowActionName,ghaworkflowString,ghaworkflowBlockRegion,@ghaworkflowBody
syn cluster ghaworkflowBody contains=ghaworkflowAttr,ghaworkflowAttrName,ghaworkflowString

syn match ghaworkflowBlockRegion /^\<\%(workflow\|action\)\s\+"\%(\\"\|[^"]\)*"\s*{\_[^}]*}/ contains=@ghaworkflowBlock
syn match ghaworkflowBlockKind /\<\%(workflow\|action\)\>/ nextgroup=ghaworkflowActionName skipwhite skipnl contained containedin=ghaworkflowBlockRegion display
syn region ghaworkflowActionName start=+"+ skip=+\\\\\|\\"+ end=+"+ nextgroup=ghaworkflowBodyRegion skipwhite skipnl contained containedin=ghaworkflowBlockRegion
syn region ghaworkflowBodyRegion start=+{+ end=+}+ contained containedin=ghaworkflowBlockRegion contains=@ghaworkflowBody
syn match ghaworkflowAttr /\h\w*\s*=\s*.\+$/ contained containedin=ghaworkflowBodyRegion contains=ghaworkflowAttrName,ghaworkflowString
syn match ghaworkflowEnvName /\h\w*\%(\s*=\s*"\)\@=/ contained containedin=ghaworkflowAttr
syn match ghaworkflowAttrName /\%(on\|resolves\|needs\|uses\|runs\|args\|env\|secrets\)\%(\s*=\)\@=/ contained containedin=ghaworkflowAttr
syn region ghaworkflowString start=+"+ skip=+\\\\\|\\"+ end=+"+ contained containedin=ghaworkflowAttr

syn sync maxlines=100

hi def link ghaworkflowBlockKind Statement
hi def link ghaworkflowActionName Title
hi def link ghaworkflowAttrName Identifier
hi def link ghaworkflowEnvName PreProc
hi def link ghaworkflowString String

let b:current_syntax = "ghaworkflow"

let &cpo = s:cpo_save
unlet s:cpo_save
