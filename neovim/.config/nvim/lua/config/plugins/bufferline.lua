local highlights = nil

local has_catppuccin_bufferline, catppuccin_bufferline = pcall(require, "catppuccin.special.bufferline")
if has_catppuccin_bufferline then
	highlights = catppuccin_bufferline.get_theme()
else
	-- Backward compatibility with older catppuccin layouts.
	local has_legacy_catppuccin, legacy_catppuccin = pcall(require, "catppuccin.groups.integrations.bufferline")
	if has_legacy_catppuccin then
		highlights = legacy_catppuccin.get()
	end
end

require("bufferline").setup({
	highlights = highlights,
	options = {
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
