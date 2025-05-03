--Themes in telescope
return {
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
	'AlexvZyl/nordic.nvim',
	-- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
	-- priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("config.themes")
	end,
}
