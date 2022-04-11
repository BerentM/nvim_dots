-- LOCAL {{{

local o = vim.opt -- global options
local wo = vim.wo -- window options
local bo = vim.bo -- buffer options
local fn = vim.fn
local vg = vim.g

-- }}}
-- OPTIONS {{{

-- Make it easy to load pynvim in each of the virtual envs
vg.python3_host_prog = 'C:\\Users\\beren\\scoop\\apps\\python\\current\\python.exe'

-- Fold code blocks
o.foldmethod = "marker"
o.foldmarker="{{{,}}}"

-- Line numbers
o.number = true

-- Row width == 80 characters
o.textwidth = 80

-- Tab equalize to 4 spaces
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.smartindent = true

-- Change tabs to spaces
o.expandtab = true

-- Mark current line
o.cursorline = true

-- Show commands
o.showcmd = true

-- Spell checking
o.spelllang = "en_us,pl"

-- Show nine spell checking candidates at most
o.spellsuggest = "best,9"

-- Dynamic menu at screen bottom
o.wildmenu = true

-- Match/mark brackets
o.showmatch = true
o.matchtime = 3

-- }}}
-- COLORSCHEME{{{

-- Looks cool with terminal font: 'Caskaydia Cove Nerd Font'
o.termguicolors = true
o.syntax = "on"

-- Theme opts
require('nord').set()
vg.nord_contrast = true
vg.nord_borders = true
vg.nord_italic = false

-- }}}
