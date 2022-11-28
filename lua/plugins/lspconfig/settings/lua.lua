local M = {}

M.neodev_setup = function()
  local ok, neodev = pcall(require, "neodev")

  if not ok then
    return
  end

  neodev.setup {
    library = {
      plugins = { "nvim-treesitter", "dressing.nvim" },
    },
    setup_jsonls = false,
  }
end

M.setup = function(on_attach, capabilities)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      Lua = {
        telemetry = { enable = false },
        runtime = {
          version = "LuaJIT",
          special = {
            reload = "require",
          },
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          checkThirdParty = false,
          maxPreload = 5000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  return opts
end

return M
