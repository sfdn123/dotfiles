-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ~/.config/nvim/lua/config/autocmds.lua

-- Markdown のスペルチェック下線を無効化
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
    vim.b.snacks_indent = false
    vim.b.snacks_scope = false
  end,
})

-- Snacks Explorer の ignored 表示が暗すぎるので少し明るくする
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { link = "Comment" })
    -- 通常フォルダは少し明るく
    vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { link = "Normal" })
    vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Normal" })

  end,
})
