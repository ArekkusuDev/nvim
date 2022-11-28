local ok, feline = pcall(require, "feline")
local c = require "plugins.feline.components"

if not ok then
  return
end

local left = {
  c.vim_mode,
  c.file_info,
  c.git_branch,
  c.git_diff_added,
  c.git_diff_removed,
  c.git_diff_changed,
  c.separator,
}

local middle = {
  c.lsp_progress,
}

local right = {
  c.diagnostic_errors,
  c.diagnostic_warnings,
  c.diagnostic_info,
  c.diagnostic_hints,
  c.lsp_client_names,
  c.file_type,
  c.file_encoding,
  c.line_percentage,
  c.scroll_bar,
}

local components = {
  active = {
    left,
    middle,
    right,
  },
}

feline.setup {
  theme = require("plugins.feline.colors").macchiato,
  components = components,
  vi_mode_colors = c.vi_mode_colors,
  disable = {
    filetypes = {
      "^NvimTree$",
      "^packer$",
      "^startify$",
      "^fugitive$",
      "^fugitiveblame$",
      "^qf$",
      "^help$",
      "^lspinfo$",
      "^mason$",
      "^DressingInput$",
      "^$", -- no file is open
    },
  },
}
