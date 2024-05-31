return {
	"ggandor/leap.nvim",
	enabled = true,
	keys = {
		{ "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
		{ "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
		{ "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
	},
	config = function(_, opts)
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		leap.add_default_mappings(true)
		vim.keymap.del({ "x", "o" }, "x")
		vim.keymap.del({ "x", "o" }, "X")
	end,
}
