-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- theme: OneDark-Pro Night Flat
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        colors = {
          bg0 = "#16191d",
          bg1 = "#1e2227",
          bg2 = "#2c313c",
          bg3 = "#3e4452",
          bg_d = "#111417",
        },
        highlights = {
          ["@property"] = { fg = "$fg" },
          ["@variable.member"] = { fg = "$fg" },
          ["@variable.parameter.builtin"] = { fg = "$red" },
          ["@lsp.type.enumMember"] = { fg = "$fg" },
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
