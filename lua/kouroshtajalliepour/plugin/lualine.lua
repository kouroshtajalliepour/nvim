return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",  -- load lazily
	opts = {
		options = {
			theme = "gruvbox",           -- pick your favorite theme
			section_separators = { "", "" },
			component_separators = { "|", "|" },
		},
		sections = {
			lualine_a = {"mode"},
			lualine_b = {"branch"},
			lualine_c = {"filename"},
			lualine_x = {},
			lualine_y = {"progress"},
			lualine_z = {"location"},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {"filename"},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
