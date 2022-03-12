require('telescope').setup{
defaults = {
	prompt_prefix = "↪ ",
},
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}

require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
require("telescope").load_extension "dap"

-- remaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>")
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope file_browser<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- error movement, req working lsp
vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
