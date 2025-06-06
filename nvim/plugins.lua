local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"golines",
				"goimports",
				"mypy",
				"pyright",
				"debugpy",
				"black",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		ft = { "go", "python", "lua" },
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		init = function(_, opts)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap_python")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.fn.sign_define("DapBreakpoint", {
				text = "🌮",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})
			vim.fn.sign_define("DapStopped", {
				text = "➡️",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		--   opts = function()
		--       return { dap_configurations = {
		--         {
		--           type = "go",
		--           name = "Attach remote",
		--           mode = "remote",
		--           request = "attach",
		--         },
		--       },
		--     }
		-- end,
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"phaazon/hop.nvim",
		lazy = true,
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("core.utils").lazy_load("todo-comments.nvim")
		end,
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},
	-- {
	--   "christoomey/vim-tmux-navigator",
	--   lazy=false,
	-- },
	{
		"ruifm/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("gitlinker").setup({
				callbacks = {
					["gitlab.cargo.one"] = require("gitlinker.hosts").get_gitlab_type_url,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		init = function(_, opts)
			require("treesitter-context").setup(opts)
		end,
	},
	-- {
	--   "nvim-telescope/telescope.nvim",
	--   dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
	--   config = function()
	--     require("telescope").load_extension("live_grep_args")
	--   end,
	--   lazy=false,
	-- },
	-- {
	--   "lewis6991/gitsigns.nvim",
	--   opts = {
	--     signs = {
	--       add = "+"
	--     },
	--   },
	-- }
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
		defaults = {
			file_ignore_patterns = { "node_modules", "vendor", "*.sql.go" },
		},
		extensions_list = { "themes", "terms", "live_grep_args" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- {'akinsho/git-conflict.nvim', version = "*", config = true}
	{
		"jbyuki/instant.nvim",
		lazy = false,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup({
				search_venv_managers = false, -- disables poetry/conda if not needed
				search = true,
				name = { ".venv", "venv" }, -- folders to auto-detect
				auto_refresh = true,
				auto_activate = true,
			})
		end,
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" },
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},
	{
		"nvim-neotest/neotest",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						-- Optional: customize if needed
						dap = { justMyCode = false },
						-- Automatically pick the current Python from the activated venv
						python = function()
							local venv = os.getenv("VIRTUAL_ENV")
							local python_path = venv and (venv .. "/bin/python") or "python"
							return python_path
						end,

						args = { "--ignore=src", "--log-level", "DEBUG" },
					}),
				},
			})
		end,
	},
}

return plugins
