local present, packer = pcall(require, "plugins.packerInit")
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
vim.cmd([[autocmd BufWritePre <buffer> silent! EslintFixAll]])

if not present then
  return false
end

local use = packer.use

return packer.startup(function()
  use({
    "nvim-lua/plenary.nvim",
  })

  use({
    "wbthomason/packer.nvim",
    event = "VimEnter",
  })

  use({
    "kyazdani42/nvim-web-devicons",
  })

  use({
    "hoob3rt/lualine.nvim",
    --after = "onedark.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        char = "|",
        show_current_context = true,
      })
    end,
  })

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
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
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({})
    end,
    cmd = { "NvimTreeToggle" },
  })

  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("plugins.configs.catppuccin")
    end,
  })

  use({
    "Raimondi/delimitMate",
  })

  use({
    "rcarriga/nvim-notify",
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({ map_cr = false })
    end,
  })

  use({
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function()
      require("sniprun").setup({
        display = {
          "Terminal",
        },
      })
    end,
  })

  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  })
  --
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end,
  })

  use({
    "neovim/nvim-lspconfig",
  })

  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    require = "neovim/nvim-lspconfig",
    require = "windwp/nvim-autopairs",
    config = function()
      vim.g.coq_settings = {
        auto_start = true,
        keymap = {
          recommended = false,
          jump_to_mark = "<C-f>",
        },
        --[[clients = {
            tabnine = {
              enabled = true
            }
          }]]
        --
      }
      require("coq")
      require("plugins.configs.coq")
      require("plugins.configs.lspconfig")
    end,
  })

  use({
    "ms-jpq/coq.artifacts",
    branch = "artifacts",
  })

  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
        hint_enable = true,
        doc_lines = 0,
      })
    end,
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
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
  })

  -- use({
  --   "Maan2003/lsp_lines.nvim",
  --   config = function()
  --     vim.diagnostic.config({
  --       virtual_text = false,
  --     })
  --     require("lsp_lines").setup()
  --   end
  -- })
  --
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.configs.null")
    end,
  })

  use({
    "ahmedkhalf/project.nvim",
    requires = "nvim-telescope/telescope.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
      })
      require("telescope").load_extension("projects")
    end,
  })

  -- use({
  --   after = "catppuccin",
  --   "neoclide/coc.nvim",
  --   branch = "release",
  --   config = function()
  --     require("plugins.configs.coc")
  --   end,
  -- })
  --
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  use({
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = true
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
    end,
  })
end)
