return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "gruvbox",
      section_separators = { "", "" },
      component_separators = { "|", "|" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        "filename",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" }, -- use Neovim LSP diagnostics
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          colored = true,
          update_in_insert = false,
        },
      },
      lualine_x = {},
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
