local ok, bufferline = pcall(require, "bufferline")

if not ok then
  return
end

local options = {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  color_icons = true,
  offsets = {
    {
      filetype = "NvimTree",
      text = "Explorer",
      highlight = "PanelHeading",
      padding = 1,
    },
    { filetype = "neo-tree", text = "Explorer", highlight = "PanelHeading", padding = 1 },
  },
  separator_style = "thin",
  buffer_close_icon = "",
  modified_icon = "●",
  close_icon = "",
  left_trunc_marker = "",
  right_trunc_marker = "",
  max_name_length = 18,
  max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
  truncate_names = true,
  tab_size = 18,
  show_buffer_close_icons = false,
  show_close_icon = false,
  always_show_bufferline = true,
}

bufferline.setup { options = options }
