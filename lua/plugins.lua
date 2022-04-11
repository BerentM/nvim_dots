-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
    return string.format("require(\"conf/%s\")", name)
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 10 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- TELESCOPE
-- install ripgrep -> scoop install ripgrep
-- make sure that "make" is there -> scoop install make
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary'} },
    config = get_config('telescope')
}
use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
}
use 'nvim-telescope/telescope-file-browser.nvim'

-- LSP
use {
    'neovim/nvim-lspconfig',
    config = get_config('lsp')
}

-- LSP autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

use {
    'jose-elias-alvarez/null-ls.nvim',     -- code formatting/actions
    config = get_config('null-ls')
}

-- GIT
use 'tpope/vim-fugitive'                   -- git
use 'lewis6991/gitsigns.nvim'              -- show git icons

-- SNIPPETS
use 'rafamadriz/friendly-snippets'

-- DEBUGGER - DAP
use 'mfussenegger/nvim-dap'
use 'leoluz/nvim-dap-go'                   -- requires delve debugger
use 'mfussenegger/nvim-dap-python'         -- requires debugpy
use 'rcarriga/nvim-dap-ui'
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}
use 'theHamsta/nvim-dap-virtual-text'
use 'nvim-telescope/telescope-dap.nvim'

-- MISC
use 'ThePrimeagen/harpoon'
use 'jiangmiao/auto-pairs'                 -- close brackets
use 'justinmk/vim-sneak'                   -- jump to two specific characters
use 'wellle/targets.vim'                   -- better changing and modifying in brackets
use 'tpope/vim-surround'                   -- bracket closing
use 'tpope/vim-commentary'                 -- smarter comments

use 'skywind3000/asynctasks.vim'           -- running programs in async manner
use 'skywind3000/asyncrun.vim'

use 'akinsho/bufferline.nvim'              -- better buffer display
use {
    'kyazdani42/nvim-tree.lua',            -- catalog tree
    requires = { {'kyazdani42/nvim-web-devicons'} },
    config = get_config('nvim_tree')
}
use 'stevearc/aerial.nvim'                 -- object/symbol tree on the right side

use 'vim-test/vim-test'                    -- better testing

-- VISUALS
use 'shaunsingh/nord.nvim'                 -- nord theme
use 'rebelot/kanagawa.nvim'                -- kanagawa theme
use {
    'nvim-lualine/lualine.nvim',            -- statusline
    config = get_config('lualine'),
    event = "VimEnter"
}
use 'SmiteshP/nvim-gps'                    -- show better context of actual line in lualine bar
use 'kyazdani42/nvim-web-devicons'         -- colorfull icons ie. for bufferline
use {
    'folke/todo-comments.nvim',             -- highlight todo comments
    requires = { {'nvim-lua/plenary'} },
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo_comments")
}
