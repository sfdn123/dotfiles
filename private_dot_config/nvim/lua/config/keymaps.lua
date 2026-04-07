-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- keymaps.vim を読み込む
vim.cmd("source " .. vim.fn.stdpath("config") .. "/keymaps.vim")

local function explorer_open_or_focus()
  local ok, Snacks = pcall(require, "snacks")
  if not ok then
    return
  end

  local picker = (Snacks.picker.get({ source = "explorer" }) or {})[1]
  if picker then
    local curwin = vim.api.nvim_get_current_win()
    local layout = picker.layout
    if layout then
      if layout.root and layout.root.win == curwin then
        return
      end
      for _, win in pairs(layout.wins or {}) do
        if win and win.win == curwin then
          return
        end
      end
      for _, win in pairs(layout.box_wins or {}) do
        if win and win.win == curwin then
          return
        end
      end
    end
    picker:focus("list", { show = true })
    return
  end

  Snacks.explorer.open()
end

-- エクスプローラーを開いて移動（開いていても閉じない。カーソルは移動）
-- - エクスプローラー未表示なら開いて移動
-- - すでに開いていて別ウィンドウにいる場合は、エクスプローラーにフォーカスして移動
-- - すでにエクスプローラー上にいる場合は何もしない（その場にいるので移動不要）
vim.keymap.set("n", "<C-w>e", explorer_open_or_focus, { desc = "Explorer open/focus" })
