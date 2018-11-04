Vim filetype support for [GitHub Actions][gha]
==============================================

This is a Vim filetype support for [GitHub Actions][gha].

It provides:
- Highlighting `.github/*.workflow` files.
  - It only highlights keywords described in [official document][workflow-doc]. You can easily notice wrong attribute names.
- Indentation for `.github/*.workflow` files.

![screenshot](https://github.com/rhysd/ss/blob/master/vim-github-actions/main.png?raw=true)

## Installation

If you use any package manager, please follow its instruction.

With [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'rhysd/vim-github-actions'
```

With [dein.vim](https://github.com/Shougo/dein.vim):

```vim
call dein#add('rhysd/vim-github-actions')
```

With [minpac](https://github.com/k-takata/minpac):

```vim
call minpac#add('rhysd/vim-github-actions')
```

When you're using Vim's builtin packager, please follow instruction at `:help pack-add`.


## Usage

After this plugin is loaded, highlights and indentation are automatically applied. You have nothing
to do anymore.

Please confirm that `ghaworkflow` filetype is set when you open `.github/*.workflow` files.


## Links

- [GitHub Actions][gha]
- [About GitHub Actions](https://developer.github.com/actions/)
- [Creating workflows](https://developer.github.com/actions/creating-workflows/)
- [Creating a workflow with GitHub Actions](https://help.github.com/articles/creating-a-workflow-with-github-actions/)
- [Workflow configuration options](https://developer.github.com/actions/creating-workflows/workflow-configuration-options/)


## License

[MIT License](License.txt)

[gha]: https://github.com/features/actions
[workflow-doc]: https://developer.github.com/actions/creating-workflows/workflow-configuration-options/
