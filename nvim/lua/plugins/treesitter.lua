local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = {
				__default = "// %s",
				__multiline = "/* %s */",
				tsx_element = "{/* %s */}",
				tsx_fragment = "{/* %s */}",
				tsx_attribute = "// %s",
			},
		},
	},
	ensure_installed = { "json", "bash", "lua", "vim", "markdown" },
	auto_install = true,
})
