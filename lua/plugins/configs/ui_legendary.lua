-- dependencies
local plugins = require "core.plugins"
local pickers = require "core.pickers"

if not plugins.ui.legendary["loaded"] then
    return
end

-- mapping options
local mapping_opts = {
	noremap = true,	-- defines mapping type and avoid recursive mappings
	silent = true	-- does not display output associated to inputing command
}

-- mapping modes
local NORMAL = "n"
local VISUAL = "v"
local TERMINAL = 't'

plugins.ui.legendary.setup {
    ignore_builtin = false,

    keymaps = {
		-- ====================================================================
		-- 								 RESIZING
		-- ====================================================================
		-- horizontal
		{
			'<C-S-Right>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_right(2)
			end,
			description = '[UI] Expands window horizontally',
			mode = { NORMAL },
			opts = mapping_opts
		},
		{
			'<C-S-Left>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_left(2)
			end,
			description = '[UI] Shrinks window horizontally',
			mode = { NORMAL },
			opts = mapping_opts
		},
		-- vertical
		{
			'<C-S-Up>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_up(2)
			end,
			description = '[UI] Shrinks window vertically',
			mode = { NORMAL },
			opts = mapping_opts
		},
		{
			'<C-S-Down>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_down(2)
			end,
			description = '[UI] Expands window vertically',
			mode = { NORMAL },
			opts = mapping_opts
		},
		-- ====================================================================
		-- 								 NAVIGATION
		-- ====================================================================
		-- move to right window
		{
			'<S-Right>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_right()
			end,
			description = '[NAV] Moves cursor to right window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to left window
		{
			'<S-Left>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_left()
			end,
			description = '[NAV] Moves cursor ot the left window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to the upper window
		{
			'<S-Up>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_up()
			end,
			description = '[NAV] Moves cursor to the top window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to the lower window
		{
			'<S-Down>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_down()
			end,
			description = '[NAV] Moves cursor to the bottom window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},

		-- ====================================================================
		-- 								 FINDERS
		-- ====================================================================
        -- file search
		{
        	[[<S-f>f]],
            function()
				require("telescope.builtin").find_files(pickers.sleek)
            end,
            mode = NORMAL,
            opts = mapping_opts
        },
		-- command search
		{
			'<A-l>',
			':Legendary<CR>',
			description = '[FIND] Opens Legendary command explorer',
			mode = { NORMAL },
			opts = mapping_opts
		},
    }
}
