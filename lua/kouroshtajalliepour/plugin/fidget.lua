return {
  "j-hui/fidget.nvim",
  tag = "legacy", -- optional, ensures stable version
  opts = {
    text = {
      spinner = "dots", -- animation style
      done = "✔", -- symbol when LSP task is complete
      commenced = "Started", -- prefix text
      completed = "Completed", -- suffix text
    },
    align = {
      bottom = true, -- show fidget at the bottom of the window
    },
    window = {
      blend = 0, -- transparency (0 = opaque)
    },
    fmt = {
      leftpad = true, -- add padding on the left
    },
  },
}
