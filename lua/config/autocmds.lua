--Highlights text when yanking/copying
---@diagnostic disable: undefined-global
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local original_notify = vim.notify
vim.notify = function(msg, ...)
	if type(msg) == "string" and msg:find("deprecated") then
		return
	end
	original_notify(msg, ...)
end

function Print_treesitter_node_info()
	local ts_utils = require('nvim-treesitter.ts_utils')
	local node = ts_utils.get_node_at_cursor()
	if node then
		print("Node type: " .. node:type())
		print("Node text: " .. vim.treesitter.get_node_text(node, 0))
		if node:parent() then
			print("Parent type: " .. node:parent():type())
		end
		print("Children:")
		for child, _ in node:iter_children() do
			print("  - " .. child:type() .. ": " .. vim.treesitter.get_node_text(child, 0))
		end
	else
		print("No Treesitter node found at cursor")
	end
end

vim.api.nvim_create_user_command('TSNodeInfo', Print_treesitter_node_info, {})

local function wait_for_window_to_close(bufname, callback)
	local timer = vim.loop.new_timer()
	timer:start(100, 100, vim.schedule_wrap(function()
		local bufnr = vim.fn.bufnr(bufname)
		if bufnr == -1 or not vim.api.nvim_buf_is_loaded(bufnr) then
			timer:stop()
			timer:close()
			callback()
		end
	end))
end

local function update_all()
	vim.cmd 'TSUpdate'

	wait_for_window_to_close('TSUpdate', function()
		vim.cmd 'Mason'

		wait_for_window_to_close('Mason', function()
			vim.cmd 'Lazy'
		end)
	end)
end

--Runs the update_all function
vim.api.nvim_create_user_command('UpdateAll', update_all, {})

-- Create an autocommand group for LaTeX specific settings
vim.api.nvim_create_augroup('LaTeX', { clear = true })

-- Autocommands for LaTeX files
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'tex',
	group = 'LaTeX',
	callback = function()
		-- Remap when in a .tex file
		vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, 'n', '$', 'g<space>', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, 'n', '0', 'gn', { noremap = true, silent = true })
	end,
})

------------------------------------------------------------------------
-----------------------Signs to be used in margin-----------------------
------------------------------------------------------------------------
local signs = { Error = ' ', Warning = ' ', Hint = ' ', Information = ' ' }
vim.o.signcolumn = "yes"
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
-- Ensure LSP respects the custom signs
vim.diagnostic.config({
	signs = {
		severity = {
			min = vim.diagnostic.severity.HINT
		}
	}
})
