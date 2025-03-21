return {
  {
      "hrsh7th/nvim-cmp",
      dependencies = {
          "hrsh7th/cmp-nvim-lsp",
      },

      config = function()
          local cmp = require("cmp")
            local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
          cmp.setup({
              snippet = {
                  -- REQUIRED - you must specify a snippet engine
                  expand = function(args)
                      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                  end,
              },
              window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
              },
              mapping = cmp.mapping.preset.insert({
                  -- TODO: Put these in keymap.lua
                  ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                  ["<C-j>"] = cmp.mapping.scroll_docs(4),
                  ["<C-Space>"] = cmp.mapping.complete(),
                  ["<C-e>"] = cmp.mapping.abort(),
                  ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                  ["<C-d>"] = function()
                      if cmp.visible_docs() then
                          cmp.close_docs()
                      else
                          cmp.open_docs()
                      end
                  end,
              }),
              sources = cmp.config.sources({
                  { name = "nvim_lsp" },
                  -- { name = 'vsnip' }, -- For vsnip users.
                   { name = 'luasnip' }, -- For luasnip users.
                  -- { name = 'ultisnips' }, -- For ultisnips users.
                  -- { name = 'snippy' }, -- For snippy users.
              }, {
                  { name = "buffer" },
              }),
          })
      end,
  },
}
