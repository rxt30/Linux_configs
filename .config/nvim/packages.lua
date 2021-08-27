local present, _ = pcall(require, "packerInit")
local packer = require "packer"
local use = packer.use

return packer.startup(
    function ()
        use "wbthomason/packer.nvim"

        use {
            "akinsho/nvim-bufferline.lua",
            after = "nvim-base16.lua",
            config = function ()
                require "plugins.bufferline"
            end
        }

        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function ()
                require "plugins.statusline"
            end
        }

        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function ()
                require "theme"
            end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function ()
                require "plugins.others".colorizer()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require "plugins.treesitter"
            end
        }

        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead",
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function ()
                require "plugins.lspconfig"
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function ()
               require "plugins.others".lspkind()
            end
        }

        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function ()
               require "plugins.compe"
            end,
            wants = "LuaSnip",
            require = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    confi = function ()
                       require "plugins.luasnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                }
            }

        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function ()
                require "plugins.autopairs"
            end
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved"
        }

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat"
        }

        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function ()
               require("plugins.others").neoscroll()
            end
        }
    end
)
