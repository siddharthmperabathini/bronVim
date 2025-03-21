vim.api.nvim_create_user_command("A", function()
    -- Close NvimTree if it's open
    local ok, api = pcall(require, "nvim-tree.api")
    if ok then
        api.tree.close()
    end
    -- Exit Neovim
    vim.cmd("qa")
end, {})

-- Set <leader>q as a shortcut to quit everything
vim.api.nvim_set_keymap("n", "<leader>A", ":A<CR>", { noremap = true, silent = true })

