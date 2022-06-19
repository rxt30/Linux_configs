local coq = require("coq")
local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")

local all_servers = lspinstaller.get_available_servers()
for _, lsp in ipairs(all_servers) do
  lspconfig[lsp.name].setup(coq.lsp_ensure_capabilities({}))
end
print(vim.inspect(all_server))

