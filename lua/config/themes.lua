return {
	-- Set highlights AFTER the colorscheme is loaded
	vim.api.nvim_create_autocmd('ColorScheme', {
		pattern = '*',
		callback = function()
			local hl_groups = {
				'Normal',
				'NormalNC',
				'EndOfBuffer',
				'SignColumn',
				'TelescopeNormal',
				'TelescopeBorder',
				'TelescopePromptNormal',
				'TelescopePromptBorder',
				'TelescopeResultsNormal',
				'TelescopeResultsBorder',
				'TelescopePreviewNormal',
				'TelescopePreviewBorder',
			}

			for _, group in ipairs(hl_groups) do
				vim.api.nvim_set_hl(0, group, { bg = 'none' })
			end

			vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#484F58' })
			vim.api.nvim_set_hl(0, 'TelescopePreviewLine', { bg = '#484F58' })
			vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#484F58', fg = '#ffffff' })
			vim.api.nvim_set_hl(0, 'Comment', { fg = '#B0B0B0', italic = true })
		end,
	}),

	-- Set Nordic theme globally
	vim.cmd.colorscheme 'nordic',

	--Sets specific theme for .c and .cpp files
	vim.api.nvim_create_autocmd('FileType', {
		pattern = { 'c', 'cpp' },
		callback = function()
			vim.schedule(function()
				vim.cmd.colorscheme 'github_dark'

				-- Remove the background (applies globally, but you can limit it to filetype-specific logic)
				vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#484F58' })
				vim.api.nvim_set_hl(0, 'Comment', { fg = '#B0B0B0', italic = true })

				require('lualine').setup {
					options = {
						theme = 'nordic'
					}
				}
			end)
		end,
	}),

	vim.api.nvim_create_autocmd('FileType', {
		pattern = { 'rust', 'rs' },
		callback = function()
			vim.schedule(function()
				-- vim.cmd.colorscheme 'github_dark'
				vim.cmd.colorscheme 'gruvbox'

				-- Remove the background (applies globally, but you can limit it to filetype-specific logic)
				vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#484F58' })
				vim.api.nvim_set_hl(0, 'Comment', { fg = '#B0B0B0', italic = true })

				require('lualine').setup {
					options = {
						-- theme = 'nordic'
						theme = 'gruvbox_dark'
					}
				}
			end)
		end,
	})
}
