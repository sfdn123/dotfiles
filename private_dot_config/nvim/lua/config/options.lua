-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
  virtual_text = false, -- 行末の長文を消す
  signs = true,         -- 左の小さいマークは出す
  underline = false,    -- 下線を表示しない
  update_in_insert = false,
})

-- モードを判別しやすくする（カーソル形状）
vim.opt.guicursor = table.concat({
  "n-c:block",
  "v:hor20",
  "ve:hor20",
  "i-ci:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkon0",
}, ",")

-- OSのクリップボードへyankを反映
vim.opt.clipboard = "unnamedplus"
