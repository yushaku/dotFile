local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "tsserver", "sumneko_lua", "bashls", "jsonls", "marksman" },
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = { "prettier", "stylua", "eslint_d" },
	automatic_installation = true,
})
