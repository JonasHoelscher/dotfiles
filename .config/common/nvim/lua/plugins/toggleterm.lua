return {
	"akinsho/toggleterm.nvim",
	version = "",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-]>]],
			direction = "float",
			shell = "/bin/zsh",
		})
	end,
}
