local neodev_setup = require("plugins.lspconfig.settings.lua").neodev_setup
local setup = require("plugins.lspconfig.settings.lua").setup
local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
  return
end

require "plugins.lspconfig.setup"

local on_attach = require("plugins.lspconfig.handlers").on_attach
local capabilities = require("plugins.lspconfig.handlers").capabilities

neodev_setup()
lspconfig.sumneko_lua.setup(setup(on_attach, capabilities))
