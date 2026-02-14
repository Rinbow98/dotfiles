return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	-- event = "VeryLazy",
	opts = {
		default_file_explorer = true,
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open Oil" })
	end,
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
