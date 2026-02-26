local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"ibhagwan/fzf-lua",
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"dcampos/nvim-snippy",
		config = function()
			require("snippy").setup({
				mappings = {
					is = {
						["<Tab>"] = "expand_or_advance",
						["<S-Tab>"] = "previous",
					},
				},
			})
		end,
	},
	-- look
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- misc
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	"windwp/nvim-ts-autotag",
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- "zsugabubus/crazy8.nvim", -- auto ts, sw, sts, and et,
	{
		"FotiadisM/tabset.nvim",
		config = function()
			require("tabset").setup({
				defaults = {
					tabwidth = 4,
					expandtab = true,
				},
			})
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	"sindrets/diffview.nvim",
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	},
	"MunifTanjim/nui.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
				add_blank_line_at_top = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				window = {
					popup = {
						size = {
							height = "85%",
							width = "50%",
						},
					},
					mappings = {
						["<esc>"] = "close_window",
					},
				},
			})
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
})
