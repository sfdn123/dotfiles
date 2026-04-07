return {
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      -- SSH先ではOSC52でローカルのクリップボードへコピー
      if not (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) then
        return
      end

      local osc52 = require("osc52")
      osc52.setup({})

      local function copy(lines, _)
        osc52.copy(table.concat(lines, "\n"))
      end

      local function paste()
        return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
      end

      vim.g.clipboard = {
        name = "OSC 52",
        copy = {
          ["+"] = copy,
          ["*"] = copy,
        },
        paste = {
          ["+"] = paste,
          ["*"] = paste,
        },
      }
    end,
  },
}
