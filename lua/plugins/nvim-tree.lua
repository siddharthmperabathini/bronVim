return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },  -- Adds file icons
    lazy = true,  -- Don't load immediately unless triggered
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },  -- Optional lazy-load triggers
    keys = {
        {
            "<leader>tr",  -- Your keybind
            function()
                require("nvim-tree.api").tree.toggle()
            end,
            desc = "Toggle NvimTree"
        },
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,  -- File explorer width
                side = "left",
            },
            update_focused_file = {
                enable = true,  -- Highlight current file in tree
                update_cwd = true,
            },
            git = { enable = true },  -- Show git status icons
            renderer = {
                icons = { show = { file = true, folder = true, git = true } },
            },
        })

        -- Optional: Auto-open file explorer on startup
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("nvim-tree.api").tree.open()
            end,
        })
    end
}

