# vim-agrep

This is a small vim plugin. grep in vim.
Grep asynchronously using the `job` of vim.

## Usage

This plugin will use `grepprg` to grep.
Set up `grepprg` in your vimrc with the following statement.

```vim
" use git grep.
set grepprg=git\ grep\ -I\ --line-number

" Or use ripgrep.
if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
```

Run

```vim
:Agrep foo
:Agrep foo bar "bar is the directory to search
:AgrepStop
```

## License

[MIT](LICENSE)
