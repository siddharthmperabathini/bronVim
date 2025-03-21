return {

  -- Breadcrumbs bar (in the winbar)
  {
    "Bekaboo/dropbar.nvim",
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },

  -- UI Enhancements (snacks.nvim by folke)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- Pretty input UI
      input = { enabled = true },
      -- Smooth scrolling animations
      scroll = { enabled = true, animate = { easing = "outCubic" } },
      -- Indentation guides
      indent = { enabled = true },
      -- Pretty notifications
      notifier = { enabled = true },
      -- Dim inactive scopes
      dim = { enabled = true },
      -- Pickers for LSP and files
      picker = {
        enabled = true,
        sources = {
          explorer = {
            jump = { close = true },
            win = {
              list = {
                keys = {
                  ["<c-t>"] = { "tab", mode = { "n", "i" } },
                },
              },
            },
          },
          lsp_symbols = {
            filter = {
              default = true,
            },
          },
          lsp_references = {
            include_current = true,
            include_declaration = true,
          },
        },
      },
      -- File explorer (replaces netrw)
      explorer = { enabled = true, replace_netrw = true },
      -- Quickfile for fast file access
      quickfile = { enabled = true },
    },
  },

  -- Quickfix list improvements
  {
    "stevearc/quicker.nvim",
    ft = { "qf" }, -- Only loads for quickfix windows
    keys = {
      {
        "<leader>q",
        function()
          require("quicker").toggle()
        end,
        desc = "Toggle quickfix list",
      },
    },
    opts = {
      keys = {
        {
          ">",
          function()
            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = "Expand quickfix context",
        },
        {
          "<",
          function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context",
        },
      },
    },
  },

}

