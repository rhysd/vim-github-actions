" Vim syntax file
" Language:   GitHub Actions Workflow
" Maintainer: rhysd <lin90162@yahoo.co.jp>
" License:    MIT Copyright (c) 2018 rhysd
" For bugs, patches and license go to https://github.com/rhysd/vim-github-actions

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn cluster ghaworkflowSection contains=ghaworkflowSectionName,ghaworkflowTitle,ghaworkflowString,ghaworkflowSectionRegion,@ghaworkflowBody
syn cluster ghaworkflowBody contains=ghaworkflowKeyValue,ghaworkflowIdent,ghaworkflowString

syn match ghaworkflowSectionRegion +^\<\%(workflow\|action\)\s\+"\%(\\"\|[^"]\)*"\s*{\_[^}]*}+ contains=@ghaworkflowSection
" syn region ghaworkflowSectionBody start=/{/ end=/}/
syn match ghaworkflowSectionName "\<\%(workflow\|action\)\>" nextgroup=ghaworkflowSectionTitle skipwhite skipnl contained containedin=ghaworkflowSectionRegion display
syn region ghaworkflowSectionTitle start=+"+ skip=+\\\\\|\\"+ end=+"+ nextgroup=ghaworkflowBodyRegion skipwhite skipnl contained containedin=ghaworkflowSectionRegion
syn region ghaworkflowBodyRegion start=+{+ end=+}+ contained containedin=ghaworkflowSectionRegion contains=@ghaworkflowBody
syn match ghaworkflowKeyValue "\h\w*\s*=\s*.\+$" contained containedin=ghaworkflowBodyRegion contains=ghaworkflowIdent,ghaworkflowString
syn match ghaworkflowIdent "\h\w*\%(\s*=\)\@=" contained containedin=ghaworkflowKeyValue
syn region ghaworkflowString start=+"+ skip=+\\\\\|\\"+ end=+"+ contained containedin=ghaworkflowKeyValue

syn sync maxlines=100

hi def link ghaworkflowSectionName Statement
hi def link ghaworkflowSectionTitle Title
hi def link ghaworkflowIdent Identifier
hi def link ghaworkflowString String

let b:current_syntax = "ghaworkflow"

let &cpo = s:cpo_save
unlet s:cpo_save
