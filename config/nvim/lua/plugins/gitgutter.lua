return {
	"airblade/vim-gitgutter",

	config = function()
		vim.cmd(":highlight GitGutterAdd    guifg=#76946a ctermfg=2")
		vim.cmd(":highlight GitGutterChange guifg=#DCA561 ctermfg=3")
		vim.cmd(":highlight GitGutterDelete guifg=#C34043 ctermfg=1")
	end,
}
