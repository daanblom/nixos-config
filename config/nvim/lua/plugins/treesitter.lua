return {
  {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local nts = require("nvim-treesitter")

		nts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		nts.install({
			"json",
			"javascript",
			"go",
			"yaml",
			"html",
			"css",
			"python",
			"http",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"java",
			"rust",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
}
