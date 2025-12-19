-- Set undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Toglle Zen Mode
vim.keymap.set("n", "<leader>z", "<CMD>ZenMode<CR>", { desc = "Toggle Zen Mode" })

-- Open CMD line info
vim.keymap.set("n", "<leader>Q", "q:", { desc = "Open command history" })

-- Set neotree opening
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neotree" })

-- Add switch for spell check
vim.opt.spelllang = { "en" }
function ToggleSpellLang()
	local current = vim.opt.spelllang:get()[1]
	if current == "en" then
		vim.opt.spelllang = { "de" }
		require("notify")("Spellcheck set to German")
	else
		vim.opt.spelllang = { "en" }
		require("notify")("Spellcheck set to English")
	end
end

vim.keymap.set("n", "<leader>dt", ToggleSpellLang, { desc = "Toggle spelllang (en/de)" })

-- Set signature help
vim.keymap.set("i", "<C-k>", function()
	vim.lsp.buf.signature_help()
end, { silent = true })

-- Toggle diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics" })
