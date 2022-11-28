local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

local servers = {
  "sumneko_lua",
}

local options = {
  ensure_installed = servers,
  automatic_installation = true,
}

mason_lspconfig.setup(options)
