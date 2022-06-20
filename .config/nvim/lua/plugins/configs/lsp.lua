M = {}

M.lspinstall = function()
  local setup_servers = function()
    require("lspinstall").setup()
    local servers = require("lspinstall").installed_servers()
    for _, server in pairs(servers) do
      require("lspconfig")[server].setup({})
    end
  end

  setup_servers()

  require("lspinstall").post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
  end
end

M.cmp = function()
  local cmp = require("cmp")
  local types = require("cmp.types")
  cmp.setup({
    completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-Space>"] = cmp.mapping.complete(),
      --            ['<CR>'] = cmp.mapping.confirm({
      --                    behavior = cmp.ConfirmBehavior.Replace,
      --                    select = true
      --            }),
      ["<TAB>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<S-TAB>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
    },
  })
end

return M
