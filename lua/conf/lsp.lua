-- Setup lspconfig.
-- remember about required plug 'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
local opts = { noremap=true, silent=true, buffer=0 }
local on_attach = function(client)
	-- on_attach function is run everytime something is attached to lsp
	-- vim.keymap.set requires nvim v7.0+
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- rename
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	-- code actions
	vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
	-- error movement
	vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
end

local servers = {"pyright", "gopls"}
for _, lsp in pairs(servers) do
	require'lspconfig'[lsp].setup{
		capabilities=capabilities,
		on_attach = on_attach
	}
end
