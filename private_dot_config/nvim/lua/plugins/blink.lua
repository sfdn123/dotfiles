return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- markdown では補完を出さない
      opts.enabled = function()
        return vim.bo.filetype ~= "markdown"
      end
    end,
  },
}
