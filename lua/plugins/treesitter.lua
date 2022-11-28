local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

local options = {
  ensure_installed = {
    "lua",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
  },

  indent = {
    enable = true,
  },
}

treesitter.setup(options)
