return {
	--Use "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim' },

	-- Highlight  TODO: etc in comments
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false }
	}
}
