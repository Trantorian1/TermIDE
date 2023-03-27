-- ============================================================================
-- 								SETS UP NULL-LS
-- ============================================================================

-- dependencies
local plugins = require 'core.plugins'

-- makes sure null-ls is loaded for lsp
if not plugins.linting.null_ls ["loaded"]then
	return
end

-- null-ls setup
plugins.linting.null_ls.setup {
	debounce = 10
}
