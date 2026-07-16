return {
  "MeanderingProgrammer/markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("render-markdown").setup({
      bullet = { enabled = true },
      checkbox = {
        enabled = true,
        unchecked = "󰄱 ",
        checked = "󰱒 ",
      },
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰼏 ", "󰎥 ", "󰎨 ", "󰎫 ", "󰎲 ", "󰎯 " },
      },
      code = {
        enabled = true,
      },
      pipe_table = {
        enabled = true,
      },
    })
  end,
}
