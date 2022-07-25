local cmd = vim.cmd

local map = function(mode, keys, cmd, opt)
  options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end
  -- vim.api.nvim_set_keymap(mode, keys, cmd, options)
  vim.keymap.set(mode, keys, cmd, options)
end

local mappings = function()
  map("", "j", "v:count || mode(1)[0:1] == \"no\" ? \"j\" : \"gj\"", { expr = true })
  map("", "k", "v:count || mode(1)[0:1] == \"no\" ? \"k\" : \"gk\"", { expr = true })

  cmd("silent! command PackerClean lua require 'plugins' require('packer').clean()")
  cmd("silent! command PackerCompile lua require 'plugins' require('packer').compile()")
  cmd("silent! command PackerInstall lua require 'plugins' require('packer').install()")
  cmd("silent! command PackerStatus lua require 'plugins' require('packer').status()")
  cmd("silent! command PackerSync lua require 'plugins' require('packer').sync()")
  cmd("silent! command PackerUpdate lua require 'plugins' require('packer').update()")

  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-l>", "<C-w>l")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-j>", "<C-w>j")

  map("n", "<C-n>", ":Telescope find_files <CR>")
  map("n", "<C-g>", ":Telescope live_grep <CR>")
  map("n", "<F5>", ":let b:caret = winsaveview() <CR>:%SnipRun <CR>:call winrestview(b:caret) <CR>")
  map("n", "m", require("lsp_lines").toggle)
  map("n", "f", ":lua vim.diagnostic.open_float() <CR>")
  map("n", "gd", vim.lsp.buf.definition)
end

mappings()
