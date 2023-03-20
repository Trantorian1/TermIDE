vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local path_IDE = debug.getinfo(1).source:match("@?(.*/)"):sub(1, -2)

-- adds Ignite path to vim's runtimepaths
if not vim.tbl_contains(vim.opt.runtimepath:get(), path_IDE) then
	vim.opt.rtp:append(path_IDE)
end

local lazy    = require "plugins.lazy"
local options = require "vim_opt.options"
local configs = require "plugins.configs"

lazy.setup(path_IDE)
options.setup()
configs.setup()

require('dressing').setup({
	 select = {
		telescope = require"core.pickers".sleek,

		get_config = function (opts)
			if opts.kind == 'legendary.nvim' then
				return {
					telescope = require('telescope.sorters').fuzzy_with_index_bias()
				}
			else
				return {}
			end
		end,
	}
})

-- local TelescopePrompt = {
--     TelescopePromptNormal = {
--         bg = '#2d3149',
--     },
--     TelescopePromptBorder = {
--         bg = '#2d3149',
--     },
--     TelescopePromptTitle = {
--         fg = '#2d3149',
--         bg = '#2d3149',
--     },
-- 	TelescopeResultsNormal = {
--         bg = '#1F2335',
-- 	},
-- 	TelescopeResultsBorder = {
--         bg = '#1F2335',
-- 	},
--     TelescopeResultsTitle = {
--         fg = '#1F2335',
--         bg = '#1F2335',
--     },
-- }
-- for hl, col in pairs(TelescopePrompt) do
--     vim.api.nvim_set_hl(0, hl, col)
-- end