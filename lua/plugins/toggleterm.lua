--Toggle terminal with Ctrl+b
return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require("config.toggleterm")
	end,
}
