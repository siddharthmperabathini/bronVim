return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- Load manually with :ASToggle if needed
    event = { "InsertEnter", "InsertLeave", "TextChanged", "TextChangedI" }, -- Added more events
    opts = {
      enabled = true, -- Enable auto-save on startup
      trigger_events = { -- Events that trigger saves
        immediate_save = { "BufLeave", "FocusLost" }, -- Save when leaving buffer or losing focus
        defer_save = { "TextChangedI", "TextChanged" }, -- Save on text change (normal + insert mode)
        cancel_deferred_save = { "InsertEnter" }, -- Cancel pending save when re-entering insert mode
      },
      condition = function(buf)
        local fn = vim.fn
        -- Do not save special buffers
        if fn.getbufvar(buf, "&buftype") ~= "" then return false end
        -- Only save if buffer has a filename
        return fn.expand("%") ~= ""
      end,
      write_all_buffers = false, -- Only save the active buffer
      noautocmd = false, -- Run autocmds on save
      lockmarks = false, -- Preserve marks when saving
      debounce_delay = 200, -- Small delay to prevent excessive writes
      debug = false, -- Debug mode off
    },
  },
}

