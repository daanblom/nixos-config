require("core")
require("lazySetup")
vim.opt.clipboard:append("unnamedplus")
vim.opt.guicursor = "n-v-c:block"
vim.opt_local.conceallevel = 2
vim.opt.spelllang = { "en", "nl" }
vim.cmd("set spellfile=~/.vim/spell/en.utf-8.add")
vim.cmd("set spell!")
vim.cmd("set cursorline")
vim.cmd("colorscheme db")
-- vim.cmd("colorscheme neopywal")
