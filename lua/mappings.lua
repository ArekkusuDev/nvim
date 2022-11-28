local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("n", "<Space>", "", opts)

-- Neo Tree
map("n", "<C-n>", "<cmd> NvimTreeToggle <cr>", opts)
map("n", "<leader>e", "<cmd> NvimTreeFocus <cr>", opts)

-- Bufferline
map("n", "<TAB>", "<cmd> BufferLineCycleNext <cr>", opts)
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <cr>", opts)
map("n", "<leader>x", "<cmd> Bdelete <cr>", opts)

map("n", "<ESC>", "<cmd> nohl <cr>", opts)
