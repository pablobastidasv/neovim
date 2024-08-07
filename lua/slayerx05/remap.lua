vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- movin pages up and down locate the information in the center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- when searching locate the information in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- do not lose the information copied after pasted
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"+d')
vim.keymap.set("v", "<leader>d", '"+d')

-- find and replace word
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- buffer navigation
vim.keymap.set("n", "<C-e>", ":bnext<CR>", {})
vim.keymap.set("n", "<C-n>", ":bprev<CR>", {})
vim.keymap.set("n", "<C-w>w", ":%bd|e#<CR>", {})
vim.keymap.set("n", "<C-w>x", ":bdelete<CR>", {})

-- save and exit
vim.keymap.set("n", "<leader>s", ":wa<CR>")
vim.keymap.set("n", "<leader>q", ":wq<CR>")
vim.keymap.set("n", "<leader>qa", ":wqa<CR>")
