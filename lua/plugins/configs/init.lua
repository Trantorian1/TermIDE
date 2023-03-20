local M = {}

M.setup = function()
	require "plugins.configs.color_github"
	-- require "plugins.configs.color_tundara"

	require "plugins.configs.ui_noice"
	require "plugins.configs.ui_nvim_tree"
	require "plugins.configs.ui_lualine"
	require "plugins.configs.ui_togleterm"
	require "plugins.configs.ui_virt_column"
	require "plugins.configs.ui_statuscol"
	require "plugins.configs.ui_treesitter"
	require "plugins.configs.ui_telescope"
	require "plugins.configs.ui_legendary"
	require "plugins.configs.ui_indent_blankline"

	require "plugins.configs.edit_smart_splits"
end

return M
