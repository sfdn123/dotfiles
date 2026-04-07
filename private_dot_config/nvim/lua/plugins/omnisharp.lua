return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "omnisharp") then
        table.insert(opts.ensure_installed, "omnisharp")
      end
    end,
  },
}
