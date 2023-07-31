local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "golines",
        "goimports"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
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
    end
  },
  {
    "phaazon/hop.nvim",
    lazy = true,
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require("core.utils").lazy_load "todo-comments.nvim"
    end,
    config = function (_, opts)
      require("todo-comments").setup(opts)
    end,
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy=false,
  -- },
  {
    "ruifm/gitlinker.nvim",
    dependencies = {'nvim-lua/plenary.nvim'},
    init = function()
      require("gitlinker").setup()
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
  },
  -- {'akinsho/git-conflict.nvim', version = "*", config = true}
}
return plugins
