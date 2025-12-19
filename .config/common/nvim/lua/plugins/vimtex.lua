return {
	"lervag/vimtex",
	event = "VeryLazy",
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
		vim.g.vimtex_compiler_latexmk = {
			executable = "latexmk",
			options = { "pdf, -shell-scape", "synctex=1", "-interaction=nonstopmode" },
		}
	end,
}
