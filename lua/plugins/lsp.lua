return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",         -- Go
          "pyright",       -- Python
          "clangd",        -- C/C++
          "rust_analyzer", -- Rust
          "lua_ls"         -- Lua
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Common keymap for hover
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "List references" })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostics in float" })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Add diagnostics to loclist" })
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, {})


      -- Go
      lspconfig.gopls.setup({})

      -- Python
      lspconfig.pyright.setup({})

      -- C/C++
      lspconfig.clangd.setup({})

      -- Rust
      lspconfig.rust_analyzer.setup({})

      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
            format = {
              enable = true,
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          }
        }
      })
    end
  }
}
