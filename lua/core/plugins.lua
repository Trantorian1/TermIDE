local function require_plugin(plugin_name)
	local loaded, plugin = pcall(require, plugin_name)

	if not loaded then
		plugin = {}
		plugin["loaded"] = false
	else
		plugin["loaded"] = true
	end

	return plugin
end

local M = {}

M.color = {
	github = require_plugin('github-theme'),
	tundra = require_plugin("nvim-tundra")
}

M.ui = {
	noice = require_plugin("noice"),
	nvim_tree = require_plugin('nvim-tree'),
	lualine = require_plugin('lualine'),
	toggleterm = require_plugin("toggleterm"),
	virt_column = require_plugin("virt-column"),
	statuscol = require_plugin("statuscol"),
	telescope = require_plugin("telescope"),
	legendary = require_plugin("legendary"),
	indent_blankline = require_plugin("indent_blankline"),
	treesitter = {
		configs = require_plugin("nvim-treesitter.configs")
	}
}

M.edit = {
	smart_splits = require_plugin("smart-splits")
}

return M
