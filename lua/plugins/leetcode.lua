-- Makes leetcode available through the :Leet command, needs a SESSION and crfs token
return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	-- Actual config to loaded
	opts = require("config.leetcode"),
}
