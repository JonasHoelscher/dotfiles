return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		delay = 0,
		icons = {
			mappings = true,
		},
		spec = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>b", group = "De[B]ugger" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>r", group = "[R]ename" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
