return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gd",
        function()
          local ok, lib = pcall(require, "diffview.lib")
          if ok and lib.get_current_view() then
            vim.cmd("DiffviewClose")
          else
            vim.cmd("DiffviewOpen")
          end
        end,
        desc = "Diffview Toggle",
      },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      table.insert(opts.spec, { "<leader>g", group = "Git" })
      table.insert(opts.spec, { "<leader>gd", desc = "Diffview Toggle" })
      table.insert(opts.spec, { "<leader>gH", desc = "Diffview File History" })
      table.insert(opts.spec, { "<leader>gh", desc = "Git Hunk" })
      table.insert(opts.spec, { "<leader>gg", desc = "Lazygit (Root Dir)" })
    end,
    keys = {
      { "<leader>gh", "<cmd>WhichKey <leader>gh<cr>", desc = "Git Hunk" },
    },
  },
}
