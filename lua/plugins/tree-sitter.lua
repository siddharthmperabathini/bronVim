-- List of parsers to install
local ensure_installed_parsers = {
    "lua",
    "javascript",
    "python",
    "c",
    "vim",
    "vimdoc",
    "html",
    "css",
    "make",
    "bash",
}

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- Load immediately
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local tsconfig = require("nvim-treesitter.configs")

        tsconfig.setup({
            ensure_installed = ensure_installed_parsers,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })

        -- Folding config removed to avoid conflicts with autocompletion
        -- You can re-enable folding later if needed by configuring foldmethod, foldexpr, etc.
    end,
}

