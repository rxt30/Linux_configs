local present, packer = pcall(require, "plugins.packerInit")
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

if not present then
    return false
end

local use = packer.use

return packer.startup(function ()
    use {
        "nvim-lua/plenary.nvim"
    }

    use {
       "wbthomason/packer.nvim",
       event = "VimEnter"
    }

    use {
        "kyazdani42/nvim-web-devicons"
    }

    use {
        "hoob3rt/lualine.nvim",
        --after = "onedark.nvim",
        config = function ()
            require 'lualine'.setup {
                options = {
                    theme = 'everforest'
                }
            }
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()

          require("indent_blankline").setup {
            char = "|",
            show_current_context = true,
          }
        end
    }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function ()
            require("colorizer").setup()
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

--[[    use {
        "kabouzeid/nvim-lspinstall",
        config = function ()
            require "plugins.configs.lsp".lspinstall()
        end
    }

    use {
        "neovim/nvim-lspconfig",
    }

    --Autocompletion and snippets
    use {
        "hrsh7th/nvim-cmp",
        config = function ()
            require "plugins.configs.lsp".cmp()
        end
    }

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-buffer"
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip']]--

    use {
        "kyazdani42/nvim-tree.lua",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup{} end,
        cmd = { "NvimTreeToggle" }
    }

    use {
        "sainnhe/everforest",
        config = function ()
            --require('onedark').setup()
            vim.cmd[[colorscheme everforest]]
            vim.cmd[[let g:everforest_diagnostic_text_highlight = 1]]
            vim.cmd[[let g:everforest_diagnostic_line_highlight = 1]]
        end
    }

    use {
        "Raimondi/delimitMate"
    }

    use {
        "windwp/nvim-autopairs",
        config = function ()
          require 'nvim-autopairs'.setup()
        end
    }

    use {
        "neoclide/coc.nvim", branch = 'release',
        config = function ()
          require 'plugins.configs.coc' 
        end
    }
        
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "sandwich"}
        end
    }

    use {
      "thinca/vim-quickrun"
    }
end)
