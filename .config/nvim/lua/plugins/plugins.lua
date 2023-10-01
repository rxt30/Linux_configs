return {
  {
    "nvim-lua/plenary.nvim",
  },

  {
    "kyazdani42/nvim-web-devicons",
  },

  {
    "hoob3rt/lualine.nvim",
    --after = "onedark.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        char = "|",
        show_current_context = true,
      })
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          enable = true,
          hlmap = {
            punctuation = {
              bracket = nil,
            },
          },
        },
      })
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("nvim-tree").setup({})
    end,
    cmd = { "NvimTreeToggle" },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("plugins.configs.catppuccin")
    end,
  },

  {
    "Raimondi/delimitMate",
  },

  {
    "rcarriga/nvim-notify",
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({ map_cr = false })
    end,
  },

  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    config = function()
      require("sniprun").setup({
        display = {
          "Terminal",
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  --
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {"neovim/nvim-lspconfig", "windwp/nvim-autopairs"},
    config = function()
      require("coq")
      require("plugins.configs.coq")
      require("plugins.configs.lspconfig")
    end,
  },

  {
    "ms-jpq/coq.artifacts",
    branch = "artifacts",
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
        hint_enable = true,
        doc_lines = 0,
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim", "williamboman/mason.nvim"},
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_tab
            }
          },
          initial_mode = "normal",
        },
        pickers = {
          find_files = {
            -- theme = "dropdown",
            initial_mode = "insert",
          },
          live_grep = {
            -- theme = "dropdown",
            initial_mode = "insert",
          },
        },
      })
    end,
  },

  -- {
  --   "Maan2003/lsp_lines.nvim",
  --   config = function()
  --     vim.diagnostic.config({
  --       virtual_text = false,
  --     },
  --     require("lsp_lines").setup()
  --   end
  -- },
  --
  {
    "folke/trouble.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("trouble").setup({})
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.configs.null")
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
      })
      require("telescope").load_extension("projects")
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.configs.dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
  },


  -- {
  --   after = "catppuccin",
  --   "neoclide/coc.nvim",
  --   branch = "release",
  --   config = function()
  --     require("plugins.configs.coc")
  --   end,
  -- },
  --
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = true
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<F12>]]
    }
  }
}
