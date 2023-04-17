" Definition of Neovim-specific things

" Link to normal Vim stuff {{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" }}}

function ResolveLocalName(filename)
    return fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vimscript/' . a:filename
endfunction

" Use the normal Vim block cursor instead of the common GUI line cursor
set guicursor=n-v-c:block-Cursor

lua require("plugins")

" Use a semicolon as the custom keymap leader character
let mapleader=";"
let maplocalleader=";"

" Line numbering {{{
set number
set cursorline
" }}}

" Expand tab to space and autoindent {{{
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
" }}}

" Case-insensitive searching {{{
set ignorecase
" }}}

" Set max text width {{{
set tw=80
" }}}

" Filetype detection {{{
filetype on
" }}}

" Show the tabline all the time {{{
set showtabline=2
" }}}

" Miscellaneous Keymaps {{{
" Map Ctrl-W to <leader>w to avoid awkwardness when switching windows
nnoremap <leader>w <c-w>
" Get out of insert mode
inoremap jk <esc>
" Open the current window in a new tab
nnoremap <leader>tsp <cmd>sp<cr><c-w>T
" Command for seeing the filetype-specific autocommands for the current file
nnoremap <leader>au :autocmd filetype_
" Vimgrep the current selected text
nnoremap <leader>vgc :vimgrep! /<c-r>//jg
" Vimgrep from base
nnoremap <leader>vgd :vimgrep /<c-r>//jg **<cr>
" Add things around the currently selected text
" Double quotes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Single quotes
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Brackets
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
" Square braces
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
" Curly braces
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
" Stringify
vnoremap <leader>jstr <esc>`>a)<esc>`<iJSON.stringify(<esc>
" }}}

" Add a command to diff the unsaved buffer with the saved version {{{
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif
" }}}

" Fix common typos {{{
iabbrev retrun return
iabbrev reutrn return
iabbrev ture true
iabbrev flase false
iabbrev rt return
iabbrev unefined undefined
" }}}

" Markdown-specific {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_ca
    autocmd FileType markdown iabbrev <buffer> bck [Back to Home](index.md)
    autocmd FileType markdown iabbrev <buffer> ch &#10004;
    autocmd FileType markdown iabbrev <buffer> x &#10008;
    autocmd FileType markdown iabbrev <buffer> qu &#10067;
    autocmd FileType markdown iabbrev <buffer> cam &#128247;
    autocmd FileType markdown iabbrev <buffer> tst &#128221;
    autocmd FileType markdown iabbrev <buffer> acc [Example\|^.png]<left><left><left><left><left>
    autocmd FileType markdown iabbrev spn </span>
    autocmd FileType markdown iabbrev spg <span style='color:#aaffaa'>
    autocmd FileType markdown iabbrev spy <span style='color:#ffffaa'>
    autocmd FileType markdown iabbrev spr <span style='color:#ffaaaa'>
    autocmd FileType markdown nnoremap <buffer> <localleader>we <cmd>w<cr><cmd>sleep 500m<cr><cmd>e<cr> 

    autocmd FileType markdown vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
    autocmd FileType markdown vnoremap <leader>* <esc>`>a*<esc>`<i*<esc>
    autocmd FileType markdown vnoremap <leader>& <esc>`>a**<esc>`<i**<esc>
augroup END
" }}}

" Vim-specific {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmarker={{{,}}}
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}} 

" C++-specific {{{
augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <leader>op <cmd>call Open_pair()<cr>
    autocmd FileType cpp iabbrev <buffer> lg qDebug() << "BLORG" <<;<right>

    " Show information on folds {{{
    autocmd FileType cpp setlocal foldcolumn=1
    autocmd FileType cpp setlocal foldmarker={,}
    autocmd FileType cpp setlocal foldmethod=marker
    " }}}
augroup END

function! Open_pair()
    let a = split(@%, "/")
    if a[-1][-1:] == 'h'
        let a[-1] = substitute(a[-1], ".h", ".cpp", "")
    else
        let a[-1] = substitute(a[-1], ".cpp", ".h", "")
    endif
    echom len(a) join(a, "/")
    execute "vsp" join(a, "/")
endfunction
" }}} 

" JSON-specific {{{
augroup filetype_json
    autocmd!
    autocmd FileType json iabbrev nwt {<cr>"team": "VUE",<cr>"ticket":<cr>"state": "not started"<cr>}<up><up><right><right><right><right><right><right><right><right><right><right><right><right><right>
augroup END
" }}}

" Gitcommit-specific {{{
augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_ca
augroup END
" }}}

" Colouring {{{
syntax enable
set termguicolors
set background=dark
colorscheme dracula
" }}}

if !empty(glob("~/.vim/vimrc_ext.vim"))
    source ~/.vim/vimrc_ext.vim
endif

" General keymaps {{{
" Keymap for :tabnew since NvimTree overwrites :Texplore
nnoremap <leader>tn <cmd>tabnew<cr>

" Split window into a new tab
nnoremap <leader>ts <cmd>tab split<cr>

" Close a tab
nnoremap <leader>tc <cmd>tabclose<cr>

" Refresh all windows in all tabs
nnoremap <leader>rff <cmd>bufdo e<cr>

" Refresh the fold markers
nnoremap <leader>rfm :set foldmethod=marker<cr>:set foldmarker={,}<cr>
" }}}

" Add keymaps for editing and sourcing the two vimrc files {{{
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>si :source ~/.vimrc<cr>
nnoremap <leader>ei :vsplit ~/.vimrc<cr>
" }}}

let s:path = ResolveLocalName('init_ext.vim')
if !empty(glob(s:path))
    exec "source" . s:path
endif
