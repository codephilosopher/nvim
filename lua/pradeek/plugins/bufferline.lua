return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      seperate_style = "padded_slant",
      offsets = {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        seperator = true,
      },
    },
  },
}
