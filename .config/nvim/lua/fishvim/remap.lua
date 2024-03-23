--vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

vim.keymap.set("n", "J", "mzJ`z") -- join line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down with screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up with screen
vim.keymap.set("n", "n", "nzzzv") -- serch down with screen
vim.keymap.set("n", "N", "Nzzzv") -- serch up with screen

-- vim.keymap.set("n", "<leader>vwm", function()
--   require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--   require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over visual selection

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without copying

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>") -- escape in insert mode

vim.keymap.set("n", "Q", "<nop>") -- disable ex mode
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- insert location
-- vim.keymap.set("n", "<leader>m", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
-- mark location
-- vim.keymap.set("n", "<leader>M", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vc", "<cmd>e ~/.config/nvim/lua/fishvim/remap.lua<CR>")
vim.keymap.set("n", "<leader>vi", "<cmd>e ~/.config/nvim/lua/fishvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vs", "<cmd>e ~/.config/nvim/lua/fishvim/set.lua<CR>")
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- vim.keymap.set("n", "<leader><leader>", function()
--   vim.cmd("so")
-- end)

-- surrounding words
vim.keymap.set("n", "<leader>aq", 'ciw""<Esc>PB', { desc = "Word Surround Quotes" })
vim.keymap.set("n", "<leader>aa", "ciw()<Esc>PB", { desc = "Word Surround Parent" })

-- slurp and barf

-- vim.api.nvim_command("normal! F(")
-- vim.api.nvim_command("normal! dlbP")

-- Map a key to the function
vim.keymap.set("n", "<leader>ah", "bf(dlbPb", { desc = "slurp back" })
vim.keymap.set("n", "<leader>aj", "mmbf(dlwPb`m", { desc = "barf back" })
vim.keymap.set("n", "<leader>ak", "mmf)dlbPb`m", { desc = "slurp forward" })
-- vim.keymap.set("n", "<leader>al", "f)dlwPB", { desc = "barf forward" })
vim.keymap.set("n", "<leader>al", "mmf)dlwPB`m", { desc = "barf forward" })

vim.keymap.set("i", "<C-h>", "<Esc>bf(dlbPbi", { desc = "slurp back" })
vim.keymap.set("i", "<C-j>", "<Esc>bf(dlwPbi", { desc = "barf back" })
vim.keymap.set("i", "<C-k>", "<Esc>f)dlbPbi", { desc = "slurp forward" })
vim.keymap.set("i", "<C-l>", "<Esc>f)dlwPBi", { desc = "barf forward" })

-- remap delete all markers
vim.keymap.set("n", "<leader>MM", ":delm!<CR>", { desc = "delete all marks" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>MN",
  ':execute "delm " . nr2char(getchar())<CR>',
  { noremap = true, silent = true }
)
-- nnoremap dm :execute 'delmarks '.nr2char(getchar())<CR>

-- vim.(keymap.)set("x", "<M-a>", "<Plug>SlurpUpDown")
-- vim.keymap.set("x", "<M-e>", "<Plug>BarfUpDown")
-- vim.keymap.set("n", "<M-a>", "<Plug>SlurpForward")
-- vim.keymap.set("n", "<M-e>", "<Plug>BarfForward")
-- vim.keymap.set("n", "<M-A>", "<Plug>SlurpBackward")
-- vim.keymap.set("n", "<M-E>", "<Plug>Bar()fBackward")
-- vim.keymap.set("n", "<M-q>", "<Plug>SplitJoin")
-- vim.keymap.set("x", "<M-q>", "<Plug>SplitJoinVisual")
-- vim.keymap.set("n", "<M-Q>", "<Plug>SplitJoinRemove")
-- vim.keymap.set("x", "<M-Q>", "<Plug>SplitJoinRemoveVisual")
-- vim.keymap.set("n", "<M-s>", "<Plug>SplitJoinSplit")
-- vim.keymap.set("x", "<M-s>", "<Plug>SplitJoinSplitVisual")
-- vim.keymap.set("n", "<M-S>", "<Plug>SplitJoinJoin")
-- vim.keymap.set("v", ">", ">gv")
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("n", ">", ">>")
-- vim.keymap.set("n", "<", "<<")
