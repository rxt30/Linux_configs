local coq = require("coq")
local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")

lspinstaller.setup {}
local all_servers = lspinstaller.get_installed_servers()
for _, lsp in ipairs(all_servers) do
    lspconfig[lsp.name].setup(coq.lsp_ensure_capabilities({}))
end

-- Custom configurations
lspconfig['sumneko_lua'].setup(coq.lsp_ensure_capabilities {
  settings = {
    Lua = {
      diagnostics = {
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
      },
      runtime = {
        version = 'LuaJIT',
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = 2
        }
      }
    }
  }
})
-- lspconfig['pylsp'].setup(coq.lsp_ensure_capabilities({}))
