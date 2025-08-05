local plugins = {
  require("plugins.colorscheme"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.neo-tree"),
  require("plugins.mason"),
  require("plugins.lsp"),
  require("plugins.go"),
  require("plugins.cmp"),
  require("plugins.debugging"),
  require("plugins.chatgpt"),
  require("plugins.gitstuff"),
}

require("lazy").setup(plugins, {})

