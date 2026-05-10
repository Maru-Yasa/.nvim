return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used in NvChad
      vim.g.copilot_no_tab_map = true; -- Disable tab mapping
      vim.g.copilot_assume_mapped = true; -- Assume that the mapping is already done
    end
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
     { "github/copilot.vim" }, -- Memastikan copilot.vim terinstal
      { "nvim-lua/plenary.nvim" }, -- Untuk utilitas fungsi
    },
    build = "make tiktoken", -- Opsional, untuk performa lebih baik
    opts = {
      debug = false, -- Set ke true jika ada masalah
      window = {
        layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
        width = 0.3,              -- 50% of screen width
      },
      auto_insert_mode = true,
    },
    keys = {
      {
        "<leader>cc",
        ":CopilotChatOpen<CR>",
        desc = "CopilotChat - Open chat",
      },
      {
        "<leader>ce",
        ":CopilotChatExplain<CR>",
        desc = "CopilotChat - Explain code",
        mode = "v", -- Hanya aktif di Visual Mode
      },
    },
  },
  -- Mason for managing LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  -- Mason LSP configuration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "intelephense", "html", "cssls" },
        handlers = {
          -- Default handler
          function(server_name)
            require("lspconfig")[server_name].setup {}
          end,
        },
      }
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
    },
    config = true,
  },

  {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vim", "lua", "vimdoc",
      "html", "css", "php", "javascript"
		},
	},
  },
}
