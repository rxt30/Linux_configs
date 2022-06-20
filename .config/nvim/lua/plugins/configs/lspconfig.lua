local coq = require("coq")
local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")

lspinstaller.setup({})
local all_servers = lspinstaller.get_installed_servers()
for _, lsp in ipairs(all_servers) do
  lspconfig[lsp.name].setup(coq.lsp_ensure_capabilities({}))
end

-- Custom configurations
lspconfig.ltex.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  settings = {
    ltex = {
      language = "de",
    },
  },
}))
