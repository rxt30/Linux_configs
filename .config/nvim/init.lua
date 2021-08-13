local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end
execute 'packadd packer.nvim'
local packager = require "packer"
packager.init()

require "packages"
require "options"
require "theme"
require "highlights"
require "mappings"
