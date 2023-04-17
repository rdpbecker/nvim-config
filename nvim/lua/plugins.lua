return require("packer").startup(function(use)
    -- Packer can manage itself
    use {"wbthomason/packer.nvim"}

    -- Easier commenting
    use {"preservim/nerdcommenter"}

    -- Better syntax tree building in Neovim
    use {"nvim-treesitter/nvim-treesitter"}

    -- Add a Git visualization column
    use {"airblade/vim-gitgutter"}

    -- Fuzzy file searching
    use {
      "nvim-telescope/telescope.nvim",
      --tag = "0.1.1",
      requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- Colouring/formatting of LSP stuff
    use {"folke/lsp-colors.nvim"}
    use {"folke/trouble.nvim"}

    -- File Explorer
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { {"kyazdani42/nvim-web-devicons"} }
    }

    -- Tabline formatting
    use {"romgrk/barbar.nvim"}
    use {"glepnir/galaxyline.nvim"}

    -- Show key bindings
    use {"folke/which-key.nvim"}

    -- Add a tagbar to the side
    use {"preservim/tagbar"}

    -- A colour scheme
    use {"dracula/vim"}

    -- Git functionality
    use {"tpope/vim-fugitive"}

    -- Add a bunch of new mappings
    use {"tpope/vim-unimpaired"}

    -- Quickfix Bindings
    use {"romainl/vim-qf"}
end)
--
--    " Jump to/see definitions
--    Plug 'pechorin/any-jump.vim'
--    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
--
--    " Code completion
--    Plug 'neoclide/coc.nvim', {'branch': 'release'}
--
--    " Distraction-free coding
--    Plug 'folke/twilight.nvim'
--
--    " Window dimming
--    Plug 'sunjon/shade.nvim'
--
--    " Fuzzy searching and dependencies (telescope)
--    Plug 'nvim-lua/popup.nvim'
--
--    " Configuration of LSP servers
--    Plug 'neovim/nvim-lspconfig'
--
--    " Easy installation of LSP servers
--    "Plug 'williamboman/nvim-lsp-installer'
--    Plug 'williamboman/mason.nvim'
--    Plug 'williamboman/mason-lspconfig.nvim'
--    Plug 'mfussenegger/nvim-lint'
--
--    " Back shell checking. Better than the LSP offered by 
--    " bash-language-server, which is used by :LspInstall bash
--    Plug 'itspriddle/vim-shellcheck'
--
--    " Colours
--    Plug 'norcalli/nvim-colorizer.lua'
