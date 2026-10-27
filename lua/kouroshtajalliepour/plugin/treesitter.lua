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

    -- nvim 0.12 hands query directives a list of nodes per capture, but nvim-treesitter's frozen
    -- master branch expects one: its code-block language directive crashes on markdown fences
    -- like ```ts. Replace just that directive (after master registers its own). Remove this when
    -- moving to the `main` branch.
    require("nvim-treesitter")
    vim.treesitter.query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
      local nodes = match[pred[2]]
      local node = type(nodes) == "table" and nodes[#nodes] or nodes
      if not node then return end
      local alias = vim.treesitter.get_node_text(node, bufnr):lower()
      metadata["injection.language"] = vim.treesitter.language.get_lang(alias) or alias
    end, { force = true })
  end,
}
