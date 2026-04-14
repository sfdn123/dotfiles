-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- colors overridden to match Cursor "One Dark Pro Darker" exactly
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
        colors = {
          bg0 = "#23272e",
          bg1 = "#2c313a",
          bg2 = "#323844",
          bg3 = "#3e4451",
          bg_d = "#1e2227",
          fg = "#abb2bf",
          red = "#e06c75",
          orange = "#d19a66",
          yellow = "#e5c07b",
          green = "#98c379",
          cyan = "#56b6c2",
          blue = "#61afef",
          purple = "#c678dd",
          grey = "#5c6370",
        },
        highlights = {
          ["@variable"] = { fg = "$fg" },
          ["@variable.member"] = { fg = "$fg" },
          ["@variable.builtin"] = { fg = "$red" },
          ["@variable.parameter"] = { fg = "$red" },
          ["@variable.parameter.builtin"] = { fg = "$red" },
          ["@property"] = { fg = "$fg" },
          ["@lsp.type.enumMember"] = { fg = "$fg" },
          ["@lsp.type.variable"] = { fg = "$fg" },
          ["@lsp.typemod.variable.static"] = { fg = "$fg" },
          ["@lsp.typemod.variable.defaultLibrary"] = { fg = "$fg" },
        },
      })
      require("onedark").load()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
