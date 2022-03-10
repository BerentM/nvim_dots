-- Setup lspconfig.
-- remember about required plug 'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
	vim.keymap.set("n", " a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", " f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
	-- error movement
	vim.keymap.set("n", " df", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", " dl", "<cmd>Telescope diagnostics<cr>", opts)
	vim.keymap.set("n", " dp", vim.diagnostic.goto_prev, opts)
end

local servers = {"pyright", "gopls"}
for _, lsp in pairs(servers) do
	require'lspconfig'[lsp].setup{
		capabilities=capabilities,
		on_attach = on_attach
	}
end

-- Setup nvim-cmp.
-- its used for autocompletion
vim.opt.completeopt={"menu","menuone","noselect"} -- vim setting
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<S-Tab>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<Tab>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, 
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), 
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})
