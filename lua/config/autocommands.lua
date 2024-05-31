-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		if vim.g.colors_name == "rose-pine" then
			require("leap").init_highlight(true)
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.api.nvim_set_hl(0, "LeapLabelPrimary", { bg = "none", fg = "#03fc49", bold = true })
			vim.api.nvim_set_hl(0, "LeapLabelSecondary", { bg = "none", fg = "#03fc49", bold = true })
		end
	end,
})
