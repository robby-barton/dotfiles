local plugins = vim.fn.globpath('~/.config/nvim/lua/plugins', '*.lua', false, true)

-- get all lua configs in current directory
for _, plugin_path in ipairs(plugins) do
	local plugin = plugin_path:gsub('.+/', ''):sub(0, -5)

	-- skip 'init.lua'
	if plugin ~= 'init' then
		require('plugins/' .. plugin)
	end
end
