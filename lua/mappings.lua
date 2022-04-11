local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }

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

-- Save as root
map("n", "w!!", "<cmd>'silent! write !sudo tee % >/dev/null' <bar> edit!<cr>", default_options)

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
