{ lib, helpers, opts, pkgs, ... }: {

  plugins.snacks.settings.dashboard = {
    enable = true;
    preset = {
      keys = [
        { icon = " "; key = "f"; desc = "Find File"; action = ":lua Snacks.dashboard.pick('files')"; }
        { icon = " "; key = "n"; desc = "New File"; action = ":ene"; }
        { icon = " "; key = "/"; desc = "Find Text"; action = ":lua Snacks.dashboard.pick('live_grep')"; }
        { icon = " "; key = "r"; desc = "Recent Files\n"; action = ":lua Snacks.dashboard.pick('oldfiles')"; }
        { icon = " "; key = "."; desc = "Last Session"; action = "<leader>q."; }
        { icon = " "; key = "b"; desc = "Browse Repo"; padding = 1; action = helpers.mkRaw "function() Snacks.gitbrowse() end"; }
        { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
      ];
    };
    sections = [
      { pane = 2; section = "header"; }
      {
        # pane = 2;
        section = "terminal";
        cmd = ''
          ${lib.getExe pkgs.chafa} ${opts.dashboard.wall} \
          --format symbols --symbols ${opts.dashboard.symbols} \
          ${if opts.dashboard.fg-only then "--fg-only" else ""} \
          --size 60x17 --stretch; sleep .1
        '';
        height = 17;
        padding = 1;
      }
     {
        icon = " ";
        title = "Keymaps";
        section = "keys";
        indent = 2;
        padding = 1;
      }
      { pane = 2; icon = " "; title = "Recent Files"; section = "recent_files"; indent = 2; padding = 1; }
      { pane = 2; icon = " "; title = "Projects"; section = "projects"; indent = 2; padding = 1; }
      {
        pane = 2;
        icon = " ";
        title = "Git Status";
        section = "terminal";
        enabled = helpers.mkRaw # lua
        ''
          function()
              return Snacks.git.get_root() ~= nil
          end
        '';
        cmd = "git status --short --branch --renames";
        height = 5;
        padding = 1;
        ttl = 5 * 60;
        indent = 3;
      }
    ];
  };

}
