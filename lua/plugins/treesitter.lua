return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "go", "python", "c", "java", "rust" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

