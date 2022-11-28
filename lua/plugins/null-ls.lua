local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.stylua.with {
    condition = function(utils)
      return utils.root_has_file ".stylua.toml"
    end,
  },
}

null_ls.setup {
  debug = false,
  sources = sources,
}
