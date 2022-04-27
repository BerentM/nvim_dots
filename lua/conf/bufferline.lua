require("bufferline").setup{
    options = {
        buffer_close_icon = "",
        close_icon = "",
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left"
          }
        }
    }
}

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>")

-- close buffer
vim.keymap.set("n", "<leader>qq", "<cmd>bd<CR>")
-- force close buffer
vim.keymap.set("n", "<leader>Qq", "<cmd>bd!<CR>")
-- close all bufers except current one
vim.keymap.set("n", "<leader>qo", "<cmd>%bd|edit#|bd#<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.keymap.set("n", "m]b", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "m[b", "<cmd>BufferLineMovePrev<CR>")

-- buffer pick
vim.keymap.set("n", "<leader>s", "<cmd>BufferLinePick<CR>")
