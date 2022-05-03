local map = vim.api.nvim_set_keymap
local g = vim.g
local default_options = { noremap = true, silent = true }

-- BUILTIN {{{
-- Map the leader key
map("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

-- Better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", default_options)
map("n", "<Right>", ":vertical resize -1<CR>", default_options)
map("n", "<Up>", ":resize -1<CR>", default_options)
map("n", "<Down>", ":resize +1<CR>", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- Cutting, pasting, copying from and to system clipboard
map("n", "<C-x>", "+d", default_options)
map("n", "<C-y>", "+y", default_options)
map("n", "<C-p>", "+p", default_options)
map("n", "<C-P>", "+P", default_options)

-- Quick save
map("n", "<leader>w", "<cmd>w<cr>", default_options)

-- GIT
map("n", "<leader>gg", "<cmd>Neogit<cr>", default_options)

-- Reload gitsigns due to race condition error during start
map("n", "<leader><leader>g", "<cmd>Gitsigns setup<cr>", default_options)

-- ReSource whole vim
map("n", "<leader><leader>s", "<cmd>source $MYVIMRC<cr>", default_options)

-- Edit init.vim
map("n", "<leader><leader>e", "<cmd>e $MYVIMRC<cr>", default_options)

-- Clear highlights after search
map("n", "<esc>", "<cmd>noh<return><esc>", default_options)

-- Spellchecking
map("n", "<F10>", "<cmd>set spell!<cr>", default_options)
map("i", "<F10>", "<C-O><cmd>set spell!<cr>", default_options)

-- }}}
-- PLUGINS {{{
-- VIM-TEST {{{

map("n", "<leader>t", "<cmd>TestNearest<CR>", default_options)
map("n", "<leader>tt", "<cmd>TestFile<CR>", default_options)
map("n", "<leader>ta", "<cmd>TestSuite<CR>", default_options)
map("n", "<leader>tl", "<cmd>TestLast<CR>", default_options)
map("n", "<leader>tg", "<cmd>TestVisit<CR>", default_options)

-- }}}
-- ASYNCRUN {{{

g.asyncrun_open = 6
g.asynctasks_extra_config = 'C:\\Users\\beren\\AppData\\Local\\nvim\\.tasks'

map("n", "<F5>", "<cmd>AsyncTask file-run<cr>", default_options)
map("n", "<f9>", "<cmd>AsyncTask file-build<cr>", default_options)
map("n", "<f4>", "<cmd>AsyncStop <cr>", default_options)

-- }}}
-- HARPOON {{{

map("n", "<Leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", default_options)
map("n", "<Leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", default_options)
map("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", default_options)
map("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", default_options)
map("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", default_options)
map("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", default_options)

-- }}}
-- NVIM-TREE {{{

map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", default_options)

-- }}}
-- TOGGLETERM {{{
map('t', '<esc>', [[<C-\><C-n>]], default_options)
map('t', 'jk', [[<C-\><C-n>]], default_options)
map('t', '<C-h>', [[<C-\><C-n><C-W>h]], default_options)
map('t', '<C-j>', [[<C-\><C-n><C-W>j]], default_options)
map('t', '<C-k>', [[<C-\><C-n><C-W>k]], default_options)
map('t', '<C-l>', [[<C-\><C-n><C-W>l]], default_options)
map('n', '<C-p>', '<cmd>ToggleTerm<CR>', default_options)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
-- }}}
-- }}}
