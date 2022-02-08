local present, packer = pcall(require, "plugins.packerInit")
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
vim.cmd [[autocmd BufWritePre <buffer> silent! EslintFixAll]]

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
                    theme = 'catppuccin'
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


    use {
        "kyazdani42/nvim-tree.lua",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup{} end,
        cmd = { "NvimTreeToggle" }
    }

    use {
        "catppuccin/nvim",
        as  = "catppuccin",
        config = function ()
            --require('onedark').setup()
            vim.cmd[[colorscheme catppuccin]]
            --vim.cmd[[let g:everforest_diagnostic_text_highlight = 1]]
            --vim.cmd[[let g:everforest_diagnostic_line_highlight = 1]]
        end
    }

    use {
        "Raimondi/delimitMate"
    }

    --[[use {
        "windwp/nvim-autopairs",
        config = function ()
          require 'nvim-autopairs'.setup()
        end
    }]]--

    --[[use {
        "neoclide/coc.nvim", branch = 'release',
        config = function ()
          require 'plugins.configs.coc' 
        end
    }]]--
        
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "sandwich"}
        end
    }

    use {
      "thinca/vim-quickrun"
    }

    use {
      "neovim/nvim-lspconfig",
    }

    use {
      "ms-jpq/coq_nvim", branch = "coq",
      requires = "neovim/nvim-lspconfig",
      config = function ()
        vim.g.coq_settings = {
          auto_start = true,
          clients = {
            tabnine = {
              enabled = true
            }
          }
        }
        local lsp = require "lspconfig"
        local coq = require "coq"
        lsp.pyright.setup(coq.lsp_ensure_capabilities({}))
        lsp.tsserver.setup(coq.lsp_ensure_capabilities({}))
        lsp.texlab.setup(coq.lsp_ensure_capabilities({}))
        lsp.cssls.setup(coq.lsp_ensure_capabilities({}))
        lsp.eslint.setup{
          settings = {
            codeActionOnSave = {
              enable = true
            }
          },
          autoFixOnSave = true
        }
        lsp.ltex.setup(coq.lsp_ensure_capabilities({}))
      end
    }

    use {
      "ms-jpq/coq.artifacts", branch = "artifacts"
    }
end)
