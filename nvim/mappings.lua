local M = {
	-- M.disabled = {
	--   n = {
	--       ["<leader>h"] = "",
	--       ["<C-a>"] = ""
	--   }
	-- }
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dc"] = {

			"<cmd> DapContinue <CR>",
			"Continue debugging",
		},
		["<leader>dq"] = {
			"<cmd> DapTerminate <CR>",
			"Quit debugging",
		},
		["<leader>do"] = {
			"<cmd> DapStepOver <CR>",
			"Step over while debugging",
		},
		["<leader>di"] = {
			"<cmd> DapStepInto <CR>",
			"Step into while debugging",
		},
		["<leader>dr"] = {
			"<cmd> DapToggleRepl <CR>",
			"Toggle repl  while debugging",
		},
		["<leader>ds"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"debug python test",
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last test",
		},
	},
}

M.gitsigns = {
	n = {
		["<leader>ghr"] = { "<cmd> Gitsigns reset_hunk<CR>", "Reset git hunk" },
		["<leader>ghn"] = { "<cmd> Gitsigns next_hunk<CR>", "Next git hunk" },
		["<leader>ghp"] = { "<cmd> Gitsigns prev_hunk<CR>", "Previous git hunk" },
		["<leader>ghv"] = { "<cmd> Gitsigns preview_hunk<CR>", "Preview git hunk" },
	},
}

M.telescope = {
	n = {
		["<leader>fg"] = {
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			"Telescope live grep args",
		},
		["<leader>fc"] = {
			":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
			"Telescope live grep args under cursor",
		},
		["<leader>fi"] = { "<cmd> Telescope lsp_implementations<CR>", "Telescope live grep args under cursor" },
	},
	v = {
		["<leader>fv"] = {
			":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
			"Telescope live grep args visual selection",
		},
	},
	i = {
		-- ["<C-j>"] = {":lua require('telescope.actions').cycle_history_next()<CR>", "telescope hitory next"},
		-- ["<C-k>"] = {":lua require('telescope.actions').cycle_history_prev()<CR>", "telescope hitory previous"},
	},
}
--
-- -- Your custom mappings
M.abc = {

	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	v = {
		["jk"] = { "<ESC>", "escape visual mode", opts = { nowait = true } },
	},

	n = {
		["<leader>s"] = { "<cmd> w <CR>", "Save file" },
		["<leader>h"] = { "<cmd>lua require'hop'.hint_char1()<cr>", "hop to word" },
		["="] = { "<cmd>horizontal resize +2<cr>", "horizontal size increase" },
		["-"] = { "<cmd>horizontal resize -2<cr>", "horizontal size decrease" },
		["+"] = { "<cmd>vertical resize +5<cr>", "vertical size increase" },
		["_"] = { "<cmd>vertical resize -5<cr>", "vertical size decrease" },
		["<leader>fd"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols <CR>", "dynmaic workspace symbols search" },
		["<leader>fp"] = { "<cmd>Telescope lsp_document_symbols <CR>", "document symbols" },
		["<leader>fr"] = { "<cmd>Telescope lsp_refernces <CR>", "lsp refernces" },
		["<leader>v"] = { "<cmd> vsp <CR>", "vertical split" },
		['<leader>"'] = { "<cmd> sp <CR>", "horizontal split" },
		["<leader>q"] = { "<cmd> q <CR>", "quit" },
		["<leader>Q"] = { "<cmd> q! <CR>", "force quit" },
		["<leader>tt"] = { "<cmd> Trouble diagnostics toggle focus=false filter.buf=0<CR>", "toggle trouble" },
		["<tab>"] = { "<C-i>", "jump next" },
	},

	c = {
		["jk"] = { "<ESC>", "escape command mode", opts = { nowait = true } },
	},
}

M.lsp = {
	n = {
		["<leader>lr"] = { "<cmd>LspRestart <CR>", "restart lsp" },
	},
}

M.noice = {
	n = {
		["<leader>nd"] = { "<cmd>NoiceDismiss <CR>", "dismiss noice messages" },
		["<leader>nt"] = { "<cmd>Noice telescope <CR>", "noice telescope" },
	},
}

M.disabled = {
	n = {
		["<C-i>"] = "",
	},
}

-- M.general = {
-- --   n = {
--     ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
--     ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
--     ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
--     ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
--   }
-- }

return M
