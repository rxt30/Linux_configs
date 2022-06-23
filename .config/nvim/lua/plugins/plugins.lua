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

  --    use {
  --        "nvim-treesitter/nvim-treesitter",
  --        run = ":TSUpdate"
  --    }

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
      --require('onedark').setup()
      vim.cmd([[colorscheme catppuccin]])
      --vim.cmd[[let g:everforest_diagnostic_text_highlight = 1]]
      --vim.cmd[[let g:everforest_diagnostic_line_highlight = 1]]
    end,
  })

  use({
    "Raimondi/delimitMate",
  })

  use({
    "rcarriga/nvim-notify",
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
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
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup({})
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
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use({
    "mhartington/formatter.nvim",
    config = function()
      require("plugins.configs.formatter")
    end,
  })
end)
