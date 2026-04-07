local function codex_add_from_snacks()
  local ok_snacks, snacks = pcall(require, "snacks")
  if not ok_snacks or not snacks.picker or not snacks.picker.get then
    vim.notify("Snacks picker not available", vim.log.levels.WARN)
    return
  end

  local pickers = snacks.picker.get({ tab = true })
  if not pickers or #pickers == 0 then
    vim.notify("No active Snacks picker", vim.log.levels.WARN)
    return
  end

  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()
  local picker = nil
  for i = #pickers, 1, -1 do
    local p = pickers[i]
    local function match(winobj)
      return winobj and (winobj.buf == cur_buf or winobj.win == cur_win)
    end

    if match(p.list and p.list.win) or match(p.input and p.input.win) or match(p.preview and p.preview.win) then
      picker = p
      break
    end
  end

  picker = picker or pickers[#pickers]
  if not picker then
    vim.notify("Snacks picker not found", vim.log.levels.WARN)
    return
  end

  local items = picker:selected({ fallback = true })
  if not items or #items == 0 then
    vim.notify("No items selected", vim.log.levels.WARN)
    return
  end

  local codex = require("codex")
  local added = 0
  for _, item in ipairs(items) do
    item = picker:resolve(item) or item
    local path = item.file
    if path and path ~= "" then
      codex.send_at_mention(path, nil, nil, "CodexTreeAdd")
      added = added + 1
    end
  end

  if added == 0 then
    vim.notify("No file path in selected items", vim.log.levels.WARN)
  end
end

return {
  {
    "ishiooon/codex.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = true,
    cmd = { "Codex", "CodexFocus", "CodexSend", "CodexTreeAdd" },
    keys = {
      { "<leader>co", "<cmd>Codex<cr>", desc = "Codex: Toggle" },
      { "<leader>cf", "<cmd>CodexFocus<cr>", desc = "Codex: Focus" },
      { "<leader>cs", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: Send selection" },
      {
        "<leader>cs",
        "<cmd>CodexTreeAdd<cr>",
        desc = "Codex: Add file",
        ft = { "neo-tree", "oil" },
      },
      {
        "<leader>cs",
        codex_add_from_snacks,
        desc = "Codex: Add file (Snacks)",
        ft = { "snacks_picker_list", "snacks_picker_input" },
      },
    },
    config = function()
      vim.schedule(function()
        require("codex").setup({
          status_indicator = { enabled = false },
        })
      end)
    end,
  },
}
