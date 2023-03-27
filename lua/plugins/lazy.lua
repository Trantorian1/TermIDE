local M = {}

local plugins = {

	-- DEPENDENCIES
	'stevearc/dressing.nvim',
	'nvim-tree/nvim-web-devicons',
	'MunifTanjim/nui.nvim',
	'nvim-lua/plenary.nvim',
	-- COLOSCHEMES
	'sainnhe/edge',
	-- UI
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope.nvim',
	'mrjones2014/legendary.nvim',
	'lukas-reineke/indent-blankline.nvim',
	'p00f/nvim-ts-rainbow',
	'yamatsum/nvim-cursorline',
	'shortcuts/no-neck-pain.nvim',
	'lukas-reineke/virt-column.nvim',
	{
		'SmiteshP/nvim-navic',
		dependencies = 'neovim/nvim-lspconfig'
	},
	{
		'SmiteshP/nvim-navbuddy',
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		}
	},
	-- EDIT
	'mrjones2014/smart-splits.nvim',
	'windwp/nvim-autopairs',
	'numToStr/Comment.nvim',
	'mg979/vim-visual-multi',
	'42Paris/42header',
	-- LINTING
	'jose-elias-alvarez/null-ls.nvim',
	-- LSP
	'rafamadriz/friendly-snippets',
	{
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help"
	},
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp"
	},
	'onsails/lspkind.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	-- GIT
	'lewis6991/gitsigns.nvim',
	'kdheepak/lazygit.nvim',
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
