local M = {}
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"go",
				"python",
				"markdown",
				"yaml",
				"json",
				"bash",
				"cpp",
				"css",
				"html",
				"toml",
				"regex",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
