{ opts, helpers, ... }: {
  
  autoCmd = [
    {
      desc = "Highlight yanked text";
      event = [ "TextYankPost" ];
      callback = helpers.mkRaw # lua
        ''
          function()
            vim.highlight.on_yank()
          end
        '';
    }
    {
      desc = "lsp show diagnostics on CursorHold";
      event = [ "CursorHold" ];
      callback = helpers.mkRaw # lua
        ''
          function()
            local hover_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "${opts.border}",
              source = "always",
            }
            vim.diagnostic.open_float(nil, hover_opts)
          end
        '';
    }
  ];

}
