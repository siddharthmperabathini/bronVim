return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
      },
    },
    config = function(_, opts)
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup(opts)
      mason_lspconfig.setup_handlers({
        function(server)
          require("lspconfig")[server].setup({})
        end,
      })
    end,
  },
}

