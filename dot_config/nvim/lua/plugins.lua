return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("ibhagwan/fzf-lua")
	-- lsp
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"denols",
					"lua_ls",
					"pyright",
					"sqls",
					"bashls",
				},
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								format = {
									enable = false,
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									},
								},
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			})
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.fish_indent,
					null_ls.builtins.diagnostics.fish,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.deno_fmt,
				},
			})
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"css",
					"javascript",
					"typescript",
					"python",
					"lua",
					"markdown",
					"markdown_inline",
				},
				ignore_install = { "d" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						require("snippy").expand_snippet(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "cmdline" },
					{ name = "snippy" },
				},
				mapping = {
					["<C-j>"] = require("cmp").mapping.select_next_item(),
					["<C-k>"] = require("cmp").mapping.select_prev_item(),
					["<C-l>"] = require("cmp").mapping.confirm({ select = true }),
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
				experimental = {
					ghost_text = true,
				},
			})
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("nvim-lua/plenary.nvim")
	use({
		"lukas-reineke/lsp-format.nvim",
		config = function()
			require("lsp-format").setup()
		end,
	})
	use({
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
	})
	use("dcampos/cmp-snippy")
	-- look
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	use("onsails/lspkind.nvim")
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure()
		end,
	})
	-- misc
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use("windwp/nvim-ts-autotag")
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})
	use("zsugabubus/crazy8.nvim") -- auto ts, sw, sts, and et
	use("sindrets/diffview.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	})
	use("MunifTanjim/nui.nvim")
	use({
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
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
	})
	use({
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
		end,
	})
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})
	use({
		"gaoDean/autolist.nvim",
		ft = {
			"markdown",
			"text",
			"tex",
			"plaintex",
		},
		config = function()
			local autolist = require("autolist")
			autolist.setup()
			autolist.create_mapping_hook("i", "<CR>", autolist.new)
			autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
			autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
			autolist.create_mapping_hook("n", "o", autolist.new)
			autolist.create_mapping_hook("n", "O", autolist.new_before)
			autolist.create_mapping_hook("n", ">>", autolist.indent)
			autolist.create_mapping_hook("n", "<<", autolist.indent)
			autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
			autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
			vim.api.nvim_create_autocmd("TextChanged", {
				pattern = "*",
				callback = function()
					vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
				end,
			})
		end,
	})
end)
