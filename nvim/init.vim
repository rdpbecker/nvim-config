" Definition of Neovim-specific things

" Link to normal Vim stuff {{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" }}}

function ResolveLocalName(filename)
    return fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vimscript/' . a:filename
endfunction

" Plugin setup {{{
call plug#begin(stdpath('data') . '/plugged')
    " Better syntax tree building in Neovim
    Plug 'nvim-treesitter/nvim-treesitter'

    " Jump to/see definitions
    Plug 'pechorin/any-jump.vim'
    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

    " Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Add a Git visualization column
    Plug 'airblade/vim-gitgutter'

    " Distraction-free coding
    Plug 'folke/twilight.nvim'

    " Window dimming
    Plug 'sunjon/shade.nvim'

    " Fuzzy searching and dependencies
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Configuration of LSP servers
    Plug 'neovim/nvim-lspconfig'

    " Easy installation of LSP servers
    "Plug 'williamboman/nvim-lsp-installer'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'mfussenegger/nvim-lint'

    " Back shell checking. Better than the LSP offered by 
    " bash-language-server, which is used by :LspInstall bash
    Plug 'itspriddle/vim-shellcheck'

    " Colouring/formatting of LSP stuff
    Plug 'folke/lsp-colors.nvim'
    Plug 'folke/trouble.nvim'

    " Icons
    Plug 'kyazdani42/nvim-web-devicons'

    " Easier commenting
    Plug 'preservim/nerdcommenter'

    " Tabline formatting
    Plug 'romgrk/barbar.nvim'
    Plug 'glepnir/galaxyline.nvim'

    " Colours
    Plug 'norcalli/nvim-colorizer.lua'

    " File Explorer
    Plug 'kyazdani42/nvim-tree.lua'

    " Show key bindings
    Plug 'folke/which-key.nvim'

    " Colorscheme
    Plug 'dracula/vim'

    let s:path = ResolveLocalName('plugins.vim')
    if !empty(glob(s:path))
        exec "source" . s:path
    endif
" }}}

" Source common setup. Plugin handler is closed here {{{
source ~/.vimrc
" }}}

" Use the normal Vim block cursor instead of the common GUI line
" cursor
set guicursor=n-v-c:block-Cursor

" Reduce the update time for git gutter
set updatetime=200

" General keymaps {{{
" Keymap for :Texplore because Telescope interferes with :Te and
" it's annoying.
" Note: The Texplore command doesn't exist when NvimTree is loaded.
nnoremap <leader>te <cmd>Texplore<cr>

" Keymap for :tabnew since NvimTree overwrites :Texplore
nnoremap <leader>tn <cmd>tabnew<cr>

" Split window into a new tab
nnoremap <leader>ts <cmd>tab split<cr>

" Close a tab
nnoremap <leader>tc <cmd>tabclose<cr>

" Refresh all windows in all tabs
nnoremap <leader>rf <cmd>bufdo e<cr>
" }}}

" AnyJump keymaps {{{
nnoremap <leader>ajj <cmd>AnyJump<cr>
" }}}

" Git gutter keymaps {{{
nnoremap <leader>ggn <Plug>(GitGutterNextHunk)
nnoremap <leader>ggp <Plug>(GitGutterPrevHunk)
nnoremap <leader>ggv <Plug>(GitGutterPreviewHunk)
nnoremap <leader>ggf <Plug>(GitGutterFold)
nnoremap <leader>ggs <Plug>(GitGutterStageHunk)
nnoremap <leader>ggu <Plug>(GitGutterUndoHunk)
" }}}

" Telescope setup {{{
nnoremap <leader>tlf <cmd>Telescope find_files<cr>
nnoremap <leader>tlc <cmd>Telescope commands<cr>
nnoremap <leader>tlh <cmd>Telescope highlights<cr>
nnoremap <leader>tll <cmd>Telescope live_grep<cr>
nnoremap <leader>tlp <cmd>vsplit<cr> <cmd>Telescope find_files<cr>
nnoremap <leader>tlt <cmd>tabnew<cr> <cmd>Telescope find_files<cr>
" }}}

" NvimTree keymaps {{{
nnoremap <leader>fet <cmd>NvimTreeToggle<cr>
nnoremap <leader>fer <cmd>NvimTreeRefresh<cr>
" }}}

" ShellCheck keymaps {{{
nnoremap <leader>shc <cmd>LShellCheck!<cr>
" }}}

" BarBar keymaps {{{
nnoremap <leader>bbc <cmd>BufferClose<cr>
nnoremap <leader>bbp <cmd>BufferPrevious<cr>
nnoremap <leader>bbn <cmd>BufferNext<cr>
" }}}

" Aerojump keymaps {{{
nnoremap <leader>ajs <cmd>Aerojump kbd space<cr>
nnoremap <leader>ajb <cmd>Aerojump kbd bolt<cr>
nnoremap <leader>ajm <cmd>Aerojump kbd milk<cr>
nnoremap <leader>ajd <cmd>Aerojump kbd default<cr>
" }}}

colorscheme dracula

" Initialize all the plugins from a separate file
lua require('plugin_setup')

" Add keymaps for editing and sourcing the two vimrc files {{{
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>si :source ~/.vimrc<cr>
nnoremap <leader>ei :vsplit ~/.vimrc<cr>
" }}}

" Close buffers automatically for init.vim and .vimrc when leaving them {{{
augroup config_edit_control
    autocmd!
    autocmd BufLeave $MYVIMRC bdelete ~/nvim_config/nvim/init.vim
    autocmd BufLeave ~/.vimrc bdelete ~/.vimrc
augroup END
" }}}

let s:path = ResolveLocalName('init_ext.vim')
if !empty(glob(s:path))
    exec "source" . s:path
endif
