return {
  "nvimtools/none-ls.nvim", 
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,

        -- Linters
        null_ls.builtins.diagnostics.flake8,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = bufnr, desc = "Format with null-ls" })
        end
      end
    })
  end
}

