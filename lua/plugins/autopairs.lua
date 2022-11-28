local ok, autopairs = pcall(require, "nvim-autopairs")
local ok_1, cmp = pcall(require, "cmp")

if not (ok and ok_1) then
  return
end

local options = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

autopairs.setup(options)

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
