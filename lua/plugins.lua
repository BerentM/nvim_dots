-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- PACKER {{{

local function get_config(name)
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
    return string.format("require(\"conf/%s\")", name)
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- }}}
-- TELESCOPE {{{

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

-- }}}
-- LSP {{{

use {
    'neovim/nvim-lspconfig',
    config = get_config('lsp')
}
use {
    'hrsh7th/nvim-cmp',                   -- LSP autocomplete & additional snippets
    requires = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'}
        },
    config = get_config('snip')
}
use {
    'jose-elias-alvarez/null-ls.nvim',     -- code formatting/actions
    config = get_config('null-ls')
}

-- }}}
-- GIT {{{

-- use 'tpope/vim-fugitive'                   -- git
use {
    'TimUntersberger/neogit',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = get_config('neogit')
}
use {
    'lewis6991/gitsigns.nvim',             -- show git icons
    config = get_config('gitsigns')
}

-- }}}
-- DEBUGGER - DAP {{{

use {
    'mfussenegger/nvim-dap',
    requires = {
        {'leoluz/nvim-dap-go'},            -- requires delve debugger
        {'mfussenegger/nvim-dap-python'},  -- requires debugpy
        {'rcarriga/nvim-dap-ui'},
        {'theHamsta/nvim-dap-virtual-text'},
        {'nvim-telescope/telescope-dap.nvim'},
    },
    config = get_config('dap')
}
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}

-- }}}
-- MISC {{{

use 'ThePrimeagen/harpoon'
use 'jiangmiao/auto-pairs'                 -- close brackets
use 'justinmk/vim-sneak'                   -- jump to two specific characters
use 'wellle/targets.vim'                   -- better changing and modifying in brackets
use 'tpope/vim-surround'                   -- bracket closing
use 'tpope/vim-commentary'                 -- smarter comments

use 'skywind3000/asynctasks.vim'           -- running programs in async manner
use 'skywind3000/asyncrun.vim'

use {
    'akinsho/bufferline.nvim',             -- better buffer display
    requires = { {'kyazdani42/nvim-web-devicons'} },
    config = get_config('bufferline')
}
use {
    'kyazdani42/nvim-tree.lua',            -- catalog tree
    requires = { {'kyazdani42/nvim-web-devicons'} },
    config = get_config('nvim_tree')
}
use {
    'stevearc/aerial.nvim',                -- object/symbol tree on the right side
    config = get_config('aerial')
}

use 'vim-test/vim-test'                    -- better testing

use {
  'rmagatti/auto-session',                 -- session management
  config = function()
    require('auto-session').setup {
      log_level = 'info',
      auto_session_suppress_dirs = {'~/'}
    }
  end
}

-- }}}
-- VISUALS {{{

use 'shaunsingh/nord.nvim'                 -- nord theme
use 'rebelot/kanagawa.nvim'                -- kanagawa theme
use {
    'nvim-lualine/lualine.nvim',           -- statusline
    requires = {
        {'kyazdani42/nvim-web-devicons'},
        {'SmiteshP/nvim-gps'}
    },
    event = "VimEnter",
    config = get_config('lualine')
}
use {
    'folke/todo-comments.nvim',             -- highlight todo comments
    requires = { {'nvim-lua/plenary'} },
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo_comments")
}

-- }}}
