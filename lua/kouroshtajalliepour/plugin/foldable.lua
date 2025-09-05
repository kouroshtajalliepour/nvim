return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    -- enable folding
    vim.cmd("highlight FoldColumn guifg=#89b4fa guibg=NONE") -- Catppuccin blue
    vim.o.foldcolumn = "1"      -- show fold column
    vim.o.foldlevel = 99        -- keep folds open by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    require("ufo").setup({
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d lines "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, {chunkText, chunk[2]})
            break
          end
          curWidth = curWidth + chunkWidth
        end

        table.insert(newVirtText, {suffix, "MoreMsg"})
        return newVirtText
      end
    })
  end,
}
