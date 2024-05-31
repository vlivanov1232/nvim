return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "±" },
			delete = { text = "x" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ "n", "v" }, "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to next hunk" })

			map({ "n", "v" }, "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to previous hunk" })

			-- Actions
			-- visual mode
			map("v", "<leader>ghs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "stage git hunk" })
			map("v", "<leader>ghr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "reset git hunk" })
			-- normal mode
			map("n", "<leader>ghs", gs.stage_hunk, { desc = "git stage hunk" })
			map("n", "<leader>ghr", gs.reset_hunk, { desc = "git reset hunk" })
			map("n", "<leader>ghS", gs.stage_buffer, { desc = "git Stage buffer" })
			map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
			map("n", "<leader>ghR", gs.reset_buffer, { desc = "git Reset buffer" })
			map("n", "<leader>ghp", gs.preview_hunk, { desc = "preview git hunk" })
			map("n", "<leader>ghb", function()
				gs.blame_line({ full = false })
			end, { desc = "git blame line" })
			map("n", "<leader>gd", gs.diffthis, { desc = "git diff against index" })
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "git diff against last commit" })
		end,
	},
}
