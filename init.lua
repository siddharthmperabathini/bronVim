-- Load Vim settings/options
pcall(function()
    require("settings")
end)

-- Load plugins (using lazy.nvim) {{{
pcall(function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out,                            "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
    require("lazy").setup({
        spec = {
            { import = "plugins" },
        },
        ui = {
            border = "rounded",
        },
    })
end)
-- }}}

-- Load keybindings
pcall(function()
    require("keymap")
end)

-- Load filetype-specific settings
pcall(function()
    require("filetype")
end)

-- Load snippets
pcall(function()
    require("snippets")
end)
vim.opt.list = false

vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        -- Save cursor
        local pos = vim.api.nvim_win_get_cursor(0)

        -- Check if buffer can be modified
        if vim.api.nvim_buf_get_option(0, "modifiable") then
            vim.cmd("normal! gg=G")
        end

        -- Restore cursor
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})



-- vim: ft=lua sw=4 ts=4 et fdm=marker fmr={{{,}}} foldlevel=2

vim.cmd("highlight Whitespace ctermfg=NONE guifg=NONE")

-- Disable swap files, backup, and write backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.termguicolors = true
vim.opt.background = "dark" -- Change to "light" for light mode
vim.g.material_style = "darker"  -- Choose from 'darker', 'lighter', 'palenight', 'oceanic', 'deep ocean'
--vim.cmd("colorscheme material")
vim.o.completeopt = "menu,menuone,noselect"
vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"


require("config.quit") -- Load custom quit command

