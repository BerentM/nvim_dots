require('telescope').setup{
defaults = {
	prompt_prefix = "➲ ",
},
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"

-- remaps
vim.keymap.set("n", " ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", " fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", " fb", "<cmd>Telescope file_browser<cr>")
vim.keymap.set("n", " fu", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", " fh", "<cmd>Telescope help_tags<cr>")
