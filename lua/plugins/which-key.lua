local M = {}

return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()
		require("which-key").register({
			["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
			["<leader>r"] = { name = "Run", _ = "which_key_ignore" },
			["<leader>u"] = { name = "Ui", _ = "which_key_ignore" },
			["<leader>d"] = { name = "Debug", _ = "which_key_ignore" },
			["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
			["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Harpoon File", _ = "which_key_ignore" },
			["<leader>H"] = { name = "Harpoon menu", _ = "which_key_ignore" },
		})
	end,
}
