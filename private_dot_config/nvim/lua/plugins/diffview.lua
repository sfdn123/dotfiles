return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      hooks = {
        diff_buf_win_enter = function(_bufnr, _winid, _ctx)
          -- 斜線フィラーを消す
          vim.opt_local.diffopt:remove("filler")
          local fc = vim.opt_local.fillchars:get()
          fc.diff = " "
          vim.opt_local.fillchars = fc
        end,
      },
    },
    config = function(_, opts)
      require("diffview").setup(opts)

      -- 文字色は Monokai のまま、背景だけ調整
      local function apply_diff_bg()
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2F4A33" })   -- 追加: 緑
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4F2A2A" }) -- 削除: 赤
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "NONE" })    -- 行全体は変えない
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#2C3E50" })   -- 変更文字だけ青
      end

      local group = vim.api.nvim_create_augroup("DiffviewMonokaiBg", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = apply_diff_bg,
      })

      apply_diff_bg()
    end,
  },
}
