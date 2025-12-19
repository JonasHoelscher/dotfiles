-- ====================
-- General autocommands
-- ====================

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- =================
-- File autocommands
-- =================

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Check .h files as c files not cpp
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.h",
	callback = function()
		vim.bo.filetype = "c"
	end,
})

-- Activate treesitter for the set files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "c", "cpp" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- Vertical line for specific files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "c", "cpp" },
	callback = function()
		vim.opt_local.colorcolumn = "80"
	end,
})

-- Formatter
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function()
--   vim.lsp.buf.format({ async = false })
-- end,
-- })
