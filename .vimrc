" Vim setup for things that are common to Vim and Neovim

" Use a semicolon as the custom keymap leader character
let mapleader=";"
let maplocalleader=";"

" Plugin setup {{{
if !has('nvim')
    call plug#begin('~/.vim/plugged')
endif
    " Add a tagbar to the side
    Plug 'preservim/tagbar'

    " A couple colour schemes
    Plug 'evturn/cosmic-barf'

    " Git functionality
    Plug 'tpope/vim-fugitive'

    " Add a bunch of new mappings
    Plug 'tpope/vim-unimpaired'

    " Quickfix Bindings
    Plug 'romainl/vim-qf'

    if !empty(glob("~/.vim/plugins.vim"))
        source ~/.vim/plugins.vim
    endif
call plug#end()
" }}}

" Tagbar key maps {{{
nmap <leader>tbt :TagbarToggle<CR><C-w>lzM
nmap <leader>tbp <cmd>TagbarTogglePause<CR>
" }}}

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

" Fugitive keymaps {{{
" Pull changes for the left/right window (using 3-way diff)
nnoremap <leader>fdt <cmd>diffget //2<cr>
nnoremap <leader>fdm <cmd>diffget //3<cr>
" Open all changed files in diff mode for self code review.
nnoremap <leader>fcr <cmd>Git difftool -y master<cr>
" Open all changed files during merge
nnoremap <leader>fmh <cmd>Git mergetool -y<cr>
" Diff splits
nnoremap <leader>fsv :Gvdiffsplit
nnoremap <leader>fsh :Gdiffsplit

" General git things
nnoremap <leader>gbr <cmd>Git branch<cr>
nnoremap <leader>gbl <cmd>Git blame<cr>
" }}}

" Vim-ql keymaps {{{
" Keep only the current line in the quickfix list
nnoremap <leader>qfk <cmd>.Keep<cr>
" Remove the current line from the quickfix list
nnoremap <leader>qfr <cmd>.Reject<cr>
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
    autocmd FileType markdown iabbrev <buffer> cam &#128247;
    autocmd FileType markdown iabbrev <buffer> acc [Example\|^.png]<left><left><left><left><left>
    autocmd FileType markdown iabbrev spn </span>
    autocmd FileType markdown iabbrev spg <span style='color:#aaffaa'>
    autocmd FileType markdown iabbrev spy <span style='color:#ffffaa'>
    autocmd FileType markdown iabbrev spr <span style='color:#ffaaaa'>
    autocmd FileType markdown nnoremap <buffer> <localleader>we <cmd>w<cr><cmd>sleep 500m<cr><cmd>e<cr> 
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
    execute "vsp" join([""] + a, "/")
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

" log-specific {{{
augroup filetype_test_log
    autocmd!
    autocmd FileType test_log nnoremap <localleader>rm <cmd>g@<Message\|</Message@d<cr>
augroup END
" }}}

" Colouring {{{
syntax enable
set termguicolors
set background=dark
"colorscheme hotline
colorscheme cosmic-barf
"let g:colors_name='cosmic-barf'
" }}}

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Close .vimrc buffer when we leave it {{{
augroup config_edit_control
    autocmd!
    autocmd BufLeave $MYVIMRC bd ~/.vimrc
augroup END
" }}}

if !empty(glob("~/.vim/vimrc_ext.vim"))
    source ~/.vim/vimrc_ext.vim
endif
