local opts = {
  backspace = vim.opt.backspace + { "nostop" },
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" },
  fileencoding = "utf-8",
  cul = true,
  expandtab = true,
  shiftwidth = 2,
  signcolumn = "yes",
  smartindent = true,
  copyindent = true,
  number = true,
  numberwidth = 2,
  relativenumber = true,
  tabstop = 8,
  timeoutlen = 400,
  undofile = true,
  showmode = false,
  backup = false,
  writebackup = false,
  swapfile = false,
  showtabline = 2,
  lazyredraw = true,
  mouse = "a",
  preserveindent = true,
  ignorecase = true,
  wrap = false,
  sidescrolloff = 8,
  updatetime = 300,
  termguicolors = true,
  laststatus = 3,
  smartcase = true,
  cmdheight = 0,
  fillchars = vim.opt.fillchars + { eob = " ", stl = " " },
  shortmess = vim.opt.shortmess + { c = true, s = true, I = true },
  history = 100,
}

local g = {
  zipPlugin = false, -- disable zip
  load_black = false, -- disable black
  loaded_2html_plugin = true, -- disable 2html
  loaded_getscript = true, -- disable getscript
  loaded_getscriptPlugin = true, -- disable getscript
  loaded_gzip = true, -- disable gzip
  loaded_logipat = true, -- disable logipat
  loaded_matchit = true, -- disable matchit
  loaded_netrwFileHandlers = true, -- disable netrw
  loaded_netrwPlugin = true, -- disable netrw
  loaded_netrwSettngs = true, -- disable netrw
  loaded_remote_plugins = true, -- disable remote plugins
  loaded_tar = true, -- disable tar
  loaded_tarPlugin = true, -- disable tar
  loaded_zip = true, -- disable zip
  loaded_zipPlugin = true, -- disable zip
  loaded_vimball = true, -- disable vimball
  loaded_vimballPlugin = true, -- disable vimball
  mapleader = " ",
  maplocalleader = " ",
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end

for key, value in pairs(g) do
  vim.g[key] = value
end
