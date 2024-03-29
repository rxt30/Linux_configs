local init_modules = {
  "core",
}
-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
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
require("lazy").setup("plugins")

for _, module in ipairs(init_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
