local opt = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set({ 'n', 'v' }, "<leader>ws", require("visual-whitespace").toggle, {}) -- Toggle whitespace visualization

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opt) -- Move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opt) -- Move selected lines up

vim.keymap.set("n", "J", "mzJ`z", opt)            -- Keep cursor in the middle when joining lines

vim.keymap.set("n", "n", "nzzzv", opt)            -- Keep cursor in the middle when searching
vim.keymap.set("n", "N", "Nzzzv", opt)            -- Keep cursor in the middle when searching

vim.keymap.set("v", "<", "<gv", opt)              -- Indent selected lines
vim.keymap.set("v", ">", ">gv", opt)              -- Indent selected lines

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "copy to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "copy to system clipboard" })

vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without yanking" })
vim.keymap.set("n", "<leader>D", "\"_D", { desc = "Delete without yanking" })

vim.keymap.set("i", "jj", "<Esc>", opt)        -- Exit insert mode
vim.keymap.set("n", "<C-c>", ":nohl<CR>", opt) -- Clear search highlights

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "x", '"_x', opt)                                                                                      -- Delete character without yanking

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" }) -- Search and replace

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
    })
  end,
})

-- file tabs
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opt)      -- Open new tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", opt)    -- Close tab
vim.keymap.set("n", "<leader>l", ":tabnext<CR>", opt)     -- Go to next tab
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>", opt) -- Go to previous tab

-- Copy filepath to system clipboard
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%:p')<CR>", opt) -- Copy filepath to system clipboard
vim.keymap.set("n", "<leader>yn", ":let @+=expand('%:t')<CR>", opt) -- Copy filename to system clipboard
vim.keymap.set("n", "<leader>ye", ":let @+=expand('%:e')<CR>", opt) -- Copy file extension to system clipboard

-- Spell suggestions telescope
vim.keymap.set("n", "<leader>sp", ":FzfLua spell_suggest<CR>", opt)

-- Spell Switcher
vim.api.nvim_create_user_command("SpellEN", function()
  vim.opt.spelllang = { "en" }
  vim.opt.spellfile = "~/.vim/spell/en.utf-8.add"
end, {})

vim.api.nvim_create_user_command("SpellNL", function()
  vim.opt.spelllang = { "nl" }
  vim.opt.spellfile = "~/.vim/spell/nl.utf-8.add"
end, {})

-- Theme commands

vim.api.nvim_create_user_command("DB", function()
  vim.cmd("colorscheme db")
end, {})

vim.api.nvim_create_user_command("DBdim", function()
  vim.cmd("colorscheme db-dim")
end, {})

-- Obsidian commands 
vim.keymap.set("n", "<leader>os", ":Obsidian QuickSwitch<CR>", opt)
vim.keymap.set("n", "<leader>oi", ":Obsidian TOC<CR>", opt)
vim.keymap.set("n", "<leader>ot", ":Obsidian Tags<CR>", opt)
