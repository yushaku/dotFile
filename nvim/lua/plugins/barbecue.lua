local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	---whether to show/use navic in the winbar
	---@type boolean
	show_navic = true,

	---whether to attach navic to language servers automatically
	---@type boolean
	attach_navic = true,

	---whether to create winbar updater autocmd
	---@type boolean
	create_autocmd = true,

	---buftypes to enable winbar in
	---@type string[]
	include_buftypes = { "" },

	---filetypes not to enable winbar in
	---@type string[]
	exclude_filetypes = { "gitcommit", "toggleterm" },

	modifiers = {
		---filename modifiers applied to dirname
		---@type string
		dirname = ":~:.",

		---filename modifiers applied to basename
		---@type string
		basename = "",
	},

	---returns a string to be shown at the end of winbar
	---@type fun(bufnr: number): string
	custom_section = function()
		return ""
	end,

	---`auto` uses your current colorscheme's theme or generates a theme based on it
	theme = "auto",

	---whether to replace file icon with the modified symbol when buffer is modified
	---@type boolean
	show_modified = false,

	symbols = {
		---modification indicator
		---@type string
		modified = "●",

		---truncation indicator
		---@type string
		ellipsis = "…",

		---entry separator
		---@type string
		separator = ">",
	},

	---icons for different context entry kinds
	---`false` to disable kind icons
	---@type table<string, string>|false
	kinds = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = "◩ ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = "ﳠ ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
})
