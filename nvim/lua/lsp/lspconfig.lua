local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- set keybinds
	vim.g.mapleader = " "

	-- show definition, references
	keymap.set("n", "<leader>f", "<cmd>Lspsaga lsp_finder<CR>", opts)

	-- see definition and make edits in window
	keymap.set("n", "<leader>e", "<cmd>Lspsaga peek_definition<CR>", opts)

	-- got to declaration
	keymap.set("n", "<leader>d", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- -- go to implementation
	keymap.set("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	-- show documentation for what is under cursor
	keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts)

	-- see outline on right hand side
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

	-- see available code actions
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

	-- smart rename
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

	-- show  diagnostics for line
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- show diagnostics for cursor
	keymap.set("n", "<leader>a", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	-- jump to previous diagnostic in buffer
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

	-- jump to next diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	-- TYPESCRIPT specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = {
	Error = "??? ",
	Warn = "??? ",
	Hint = "??? ",
	Info = "??? ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		numhl = "",
	})
end

-- configure html server
lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

