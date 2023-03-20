local M = {}

local plugins = {
	-- DEPENDENCIES
	'stevearc/dressing.nvim',
	'nvim-tree/nvim-web-devicons',
	'MunifTanjim/nui.nvim',
	'nvim-lua/plenary.nvim',
	-- COLOSCHEMES
	'projekt0n/github-nvim-theme',
	'sam4llis/nvim-tundra',
	-- UI
	'folke/noice.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'akinsho/toggleterm.nvim',
	'lukas-reineke/virt-column.nvim',
	'luukvbaal/statuscol.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope.nvim',
	'mrjones2014/legendary.nvim',
	'lukas-reineke/indent-blankline.nvim',
	-- EDIT
	'mrjones2014/smart-splits.nvim'
}

local opts = {
	ui = {
		border = "single",
	},
}

M.setup = function(path_IDE)
	local path_lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(path_lazy) then
	  vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		path_lazy,
	  })
	end

	if not vim.tbl_contains(vim.opt.rtp:get(), path_lazy) then
		vim.opt.rtp:append(path_lazy)
	end

	require("lazy").setup(plugins, opts)

	vim.opt.rtp:append(path_IDE)
end

return M
