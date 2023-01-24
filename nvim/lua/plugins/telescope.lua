return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_strategy = "vertical",
        layout_config = {
          preview_cutoff = 1,
          prompt_position = "top",
          horizontal = {
            preview_width = 0.6,
          },
          width = 0.8,
          height = 0.9,
        },
      },
    },
  },
}
