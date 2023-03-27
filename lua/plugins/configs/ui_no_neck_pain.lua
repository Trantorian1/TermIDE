-- dependencies
local plugins = require "core.plugins"

-- makes sure 'no-neck-pain' is loaded
if not plugins.ui.no_neck_pain["loaded"] then
	return
end

-- sets up 'no_neck_pain'
plugins.ui.no_neck_pain.setup {
	buffers = {
		scratchPad = {
            -- set to `false` to
            -- disable auto-saving
			enabled = true,
			-- set to `nil` to default 
            -- to current working directory
			location = "~/Documents/"
        },
		bo = {
            filetype = "md"
        },
	},
	bufferOptionsColors = {
		blend = -0.2,
	}
}
