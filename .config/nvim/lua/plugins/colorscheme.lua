return {
	-- add colorschemes
	-- { "navarasu/onedark.nvim" },
	-- { "projekt0n/github-nvim-theme" },
	-- { "Mofiqul/vscode.nvim" },
	-- { "EdenEast/nightfox.nvim" },
	{
		"rebelot/kanagawa.nvim",
		-- opts = {
		--      transparent = true,
		--      styles = {
		--              sidebars = "transparent",
		--              floats = "transparent",
		--      },
		-- },
	},

	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- Configure LazyVim to load
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa-paper",
		},
	},

	lazy = true,
}
