local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  print "Installing packer"
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
  vim.cmd "PackerSync"
end

local ok, packer = pcall(require, "packer")

if not ok then
  return
end

local init_options = {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

packer.init(init_options)

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use { "nvim-lua/plenary.nvim", module = "plenary" }
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    setup = function()
      require("utils.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("utils.lazy_load").treesitter_cmds,
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }()
    end,
    config = function()
      require "plugins.treesitter"
    end,
  }

  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  }

  -- LSP Stuff
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    setup = function()
      require("utils.lazy_load").on_file_open "nvim-lspconfig"
    end,
    config = function()
      require "plugins.lspconfig"
    end,
  }

  use {
    "williamboman/mason.nvim",
    cmd = require("utils.lazy_load").mason_cmds,
    config = function()
      require "plugins.mason"
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    module = { "lspconfig" },
    config = function()
      require "plugins.mason-lspconfig"
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.null-ls"
    end,
  }

  -- Completion
  use {
    "rafamadriz/friendly-snippets",
    opt = true,
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter",
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "plugins.cmp"
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require "plugins.luasnip"
    end,
  }

  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
  use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path", after = "cmp-buffer" }

  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    tag = "main",
    after = "catppuccin",
    config = function()
      require "plugins.bufferline"
    end,
  }

  use {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete" },
  }

  -- Statusline
  use {
    "feline-nvim/feline.nvim",
    after = "bufferline.nvim",
    config = function()
      require "plugins.feline"
    end,
  }

  -- File Explorer
  use {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.nvimtree"
    end,
  }

  -- Lua Dev
  use {
    "folke/neodev.nvim",
    opt = true,
    ft = "lua",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    opt = true,
    setup = function()
      require("utils.lazy_load").gitsigns()
    end,
    config = function()
      require "plugins.gitsigns"
    end,
  }

  -- Coding support
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "plugins.autopairs"
    end,
  }

  use {
    "ahmedkhalf/project.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.project"
    end,
  }

  use {
    "nvchad/nvim-colorizer.lua",
    opt = true,
    setup = function()
      require("utils.lazy_load").on_file_open "nvim-colorizer.lua"
    end,
    config = function()
      require "plugins.colorizer"
    end,
  }

  -- Themes
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    event = "UIEnter",
    run = ":CatppuccinCompile",
    config = function()
      require "plugins.catppuccin"
    end,
  }
end)
