{
  helpers,
  config,
  self,
  pkgs,
  lib,
  ...
}: let
  cfg = config.addons.ui.dashboard;
in {
  options.addons.ui.dashboard = with lib.types; {
    enable = lib.mkEnableOption "Enable Snacks dashboard module";
    wall = lib.mkOption {
      type = types.path;
      default = "${self}/assets/dashboard.png";
      description = "img which appears at dashboard";
    };
    symbols = lib.mkOption {
      type = types.str;
      default = "sextant";
      description =
      ''
        Specify character symbols to employ in final output.
        Accepted classes for
        all        ascii   braille   extra      imported  narrow   solid      ugly
        alnum      bad     diagonal  geometric  inverted  none     space      vhalf
        alpha      block   digit     half       latin     quad     stipple    wedge
        ambiguous  border  dot       hhalf      legacy    sextant  technical  wide

        These can be combined with + and -, e.g. block+border-diagonal or all-wide.
      '';
    };
    fg-only = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "If true, includes '--fg-only' in the command; otherwise, excludes it.";
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.snacks.settings.dashboard = {
      enable = true;
      preset = {
        keys = [
          { icon = " "; key = "f"; desc = "Find File"; action = "<cmd>lua Snacks.dashboard.pick('files')<cr>"; }
          { icon = " "; key = "n"; desc = "New File"; action = "<cmd>ene<cr>"; }
          { icon = " "; key = "/"; desc = "Find Text"; action = "<cmd>lua Snacks.dashboard.pick('live_grep')<cr>"; }
          { icon = " "; key = "r"; desc = "Recent Files\n"; action = "<cmd>lua Snacks.dashboard.pick('oldfiles')<cr>"; }
          { icon = " "; key = "."; desc = "Last Session"; action = "<leader>q."; }
          { icon = " "; key = "b"; desc = "Browse Repo"; padding = 1; action = "<cmd>lua Snacks.gitbrowse()<cr>"; }
          { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
        ];
      };
      sections = [
        { pane = 2; section = "header"; }
        {
          # pane = 2;
          section = "terminal";
          cmd = ''
            ${lib.getExe pkgs.chafa} ${cfg.wall} \
            --format symbols --symbols ${cfg.symbols} \
            ${if cfg.fg-only then "--fg-only" else ""} \
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
  };
}
