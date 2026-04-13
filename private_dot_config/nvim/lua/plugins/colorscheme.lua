-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
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
