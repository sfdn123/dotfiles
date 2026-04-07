return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function(_, opts)
      opts.heading = opts.heading or {}
      -- 見出しの背景色（全行の帯）を消す
      opts.heading.backgrounds = {}
      opts.bullet = opts.bullet or {}
      -- リスト記号の置き換え表示を無効化
      opts.bullet.enabled = false
      opts.sign = opts.sign or {}
      -- sign column の装飾を無効化
      opts.sign.enabled = false
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.stdpath("config") .. "/markdownlint.json",
          "-",
        },
      }
    end,
  },
}
