local M = {}
local C = require("plugins.feline.colors").macchiato
local F = require "plugins.feline.functions"

-- Vim mode
M.vi_mode_colors = {
  NORMAL = C.green,
  OP = C.green,
  INSERT = C.peach,
  VISUAL = C.mauve,
  LINES = C.peach,
  BLOCK = C.red,
  REPLACE = C.red,
  COMMAND = C.sky,
}

M.vim_mode = {
  provider = {
    name = "vi_mode",
    opts = { show_mode_name = true },
  },
  hl = function()
    return {
      fg = require("feline.providers.vi_mode").get_mode_color(),
      bg = C.base,
      style = "bold",
      name = "NeovimModeHLColor",
    }
  end,
  left_sep = "left_rounded",
  right_sep = "block",
}

-- Git
M.git_branch = {
  provider = "git_branch",
  hl = { fg = C.yellow, bg = C.base, style = "bold" },
  -- icon = "  ",
  left_sep = "block",
  right_sep = "block",
}

M.git_diff_added = {
  provider = "git_diff_added",
  hl = { fg = C.green, bg = C.base },
  left_sep = "block",
  right_sep = "block",
}

M.git_diff_removed = {
  provider = "git_diff_removed",
  hl = { fg = C.red, bg = C.base },
  left_sep = "block",
  right_sep = "block",
}

M.git_diff_changed = {
  provider = "git_diff_changed",
  hl = { fg = C.text, bg = C.base },
  left_sep = "block",
  right_sep = "right_rounded",
}

-- File
M.file_info = {
  provider = {
    name = "file_info",
    opts = { type = "unique" },
  },
  hl = { fg = C.text, bg = C.base, style = "bold" },
  left_sep = "block",
  right_sep = "block",
}

M.file_type = {
  provider = {
    name = "file_type",
    opts = { filetype_icon = true, case = "titlecase" },
  },
  hl = { fg = C.red, bg = C.base, style = "bold" },
  left_sep = "block",
  right_sep = "block",
}

M.file_encoding = {
  provider = "file_encoding",
  hl = { fg = C.peach, bg = C.base, style = "bold" },
  left_sep = "block",
  right_sep = "block",
}

-- Diagnostics
M.diagnostic_errors = {
  provider = "diagnostic_errors",
  hl = { fg = C.red },
}

M.diagnostic_warnings = {
  provider = "diagnostic_warnings",
  hl = { fg = C.yellow },
}

M.diagnostic_hints = {
  provider = "diagnostic_hints",
  hl = { fg = C.sky },
}

M.diagnostic_info = {
  provider = "diagnostic_info",
  hl = { fg = C.lavender },
  right_sep = "block",
}

-- Lsp
M.lsp_progress = {
  provider = F.lsp_progress,
  hl = { fg = C.text, style = "bold" },
  left_sep = "block",
  right_sep = "block",
}

M.lsp_client_names = {
  provider = "lsp_client_names",
  hl = { fg = C.mauve, bg = C.base, style = "bold" },
  left_sep = "left_rounded",
  right_sep = "block",
}

-- Other
M.scroll_bar = {
  provider = "scroll_bar",
  hl = { fg = C.yellow, style = "bold" },
}

M.line_percentage = {
  provider = "line_percentage",
  hl = { fg = C.sapphire, bg = C.base, style = "bold" },
  left_sep = "block",
  right_sep = "block",
}

M.separator = {
  provider = "",
}

return M
