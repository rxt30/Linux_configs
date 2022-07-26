local coq = require("coq")
local lspconfig = require("lspconfig")
local mason = require("mason-lspconfig")

mason.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(coq.lsp_ensure_capabilities({}))
  end,

  ["ltex"] = function()
    lspconfig.ltex.setup(coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      settings = {
        ltex = {
          checkFrequency = "save",
          language = "de-DE",
          dictionary = {
            ["de-DE"] = {
              "Zertifizierungsinstanz",
              "CA",
              "CAs",
            },
          },
        },
      },
    }))
  end,
})

vim.cmd([[
  autocmd BufNewFile,BufRead *.tex :set filetype=tex
]])
