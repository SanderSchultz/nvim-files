	return {
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			keymaps = {
				['<C-s>'] = false, -- Disable Oil's Ctrl+S keybinding
				["gg"] = { "actions.toggle_hidden", mode = "n" },
			}
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	}
