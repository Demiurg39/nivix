{ mkKey, helpers, ... }: let
  inherit (mkKey) mkKeymap;
in {

  plugins.snacks = {
    enable = true;
    settings = {
      animate.enable = true;
      notifier.enable = true;
      quickfile.enable = true;
      scroll.enable = true;
      words.enable = true;
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>un" (helpers.mkRaw ''function() Snacks.notifier.hide() end'')         "Dismiss All Notifications")
    (mkKeymap "n" "<leader>." (helpers.mkRaw  ''function() Snacks.scratch() end'')               "Toggle Scratch Buffer")
    (mkKeymap "n" "<leader>S" (helpers.mkRaw  ''function() Snacks.scratch.select() end'')        "Select Scratch Buffer")
    (mkKeymap "n" "<leader>n" (helpers.mkRaw  ''function() Snacks.notifier.show_history() end'') "Notification History")
    (mkKeymap "n" "<leader>cR" (helpers.mkRaw ''function() Snacks.rename.rename_file() end'')    "Rename File")
    (mkKeymap "n" "<leader>gB" (helpers.mkRaw ''function() Snacks.gitbrowse() end'')             "Git Browse")
    (mkKeymap "n" "<leader>gf" (helpers.mkRaw ''function() Snacks.lazygit.log_file() end'')      "Lazygit Current File History")
    (mkKeymap "n" "<leader>gg" (helpers.mkRaw ''function() Snacks.lazygit() end'')               "Lazygit")
    (mkKeymap "n" "<leader>gl" (helpers.mkRaw ''function() Snacks.lazygit.log() end'')           "Lazygit Log (cwd)")
  ];

  autoCmd = [
    {
      desc = "Pre init Function";
      event = [ "VimEnter" ];
      callback = helpers.mkRaw #lua
        ''
          function()
            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...)
              Snacks.debug.inspect(...)
            end
            _G.bt = function()
              Snacks.debug.backtrace()
            end
            vim.print = _G.dd -- Override print to use snacks for `:=` command

            -- Create some toggle mappings
            Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
            Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
            Snacks.toggle.diagnostics():map("<leader>ud")
            Snacks.toggle.line_number():map("<leader>ul")
            Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
            Snacks.toggle.inlay_hints():map("<leader>uh")
          end
        '';
    }
  ];

}
