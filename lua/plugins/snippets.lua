return {
  -- LuaSnip is the snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- optional, provides pre-made snippets
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- load VSCode-style snippets
    end,
  },
}

