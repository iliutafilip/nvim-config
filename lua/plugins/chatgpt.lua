return {

  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/trouble.nvim", -- optional
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "echo $OPENAI_API_KEY",
      openai_params = {
        model = "gpt-4o", -- or "gpt-3.5-turbo"
        temperature = 0.7,
        max_tokens = 1000,
      },
      -- You can add more customization here if needed
    })

    -- Example keybinding
    vim.keymap.set("n", "<leader>cg", ":ChatGPT<CR>", { desc = "Open ChatGPT" })
    -- Visual mode mappings (for selected code)
    vim.keymap.set("v", "<leader>et", ":ChatGPTRun add_tests<CR>",
      { noremap = true, silent = true, desc = "Add tests for selected code" })
    vim.keymap.set("v", "<leader>ef", ":ChatGPTRun fix_bugs<CR>",
      { noremap = true, silent = true, desc = "Fix bugs in selected code" })
    vim.keymap.set("v", "<leader>ee", ":ChatGPTRun explain_code<CR>",
      { noremap = true, silent = true, desc = "Explain selected code" })
  end,

}
