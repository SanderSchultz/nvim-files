-- GOATed file tree explorer with integrated VIM navigation
return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			['<C-s>'] = false,                       -- Disable Oil's Ctrl+S keybinding, i wanna use this keybinding to SAVE instead
			["gg"] = { "actions.toggle_hidden", mode = "n" }, -- Toggles whether to show hidden files or not
		}
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
