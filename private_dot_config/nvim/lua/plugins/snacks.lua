return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- Show gitignored files in the explorer by default.
            ignored = true,
            transform = function(item)
              if item.file and not item.dir and item.file:sub(-5) == ".meta" then
                item.filename_hl = "SnacksPickerDimmed"
              end
              return item
            end,
          },
        },
      },
    },
  },
}
