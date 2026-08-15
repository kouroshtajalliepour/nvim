return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "python",
        "yaml",
        "hcl",
        "terraform",
        "json",
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "query",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
