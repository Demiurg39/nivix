{
  inputs,
  mkPkgs,
  config,
  lib,
  ...
}: let
  cfg = config.addons.ui.beacon;
in {
  options.addons.ui.beacon.enable = lib.mkEnableOption "Enable beacon module";

  config = lib.mkIf cfg.enable {
    extraPlugins = [
      (mkPkgs "beacon" inputs.beacon)
    ];

    # auto-session breaks beacon without it
    # https://github.com/DanilaMihailov/beacon.nvim/issues/36
    plugins.lz-n = lib.mkIf config.addons.utils.auto-session.enable {
      enable = true;
      plugins = [{
        __unkeyed-1 = "beacon.nvim";
        event = "CursorMoved";
        after = ''
          function()
            require('beacon').setup()
          end
        '';
      }];
    };
  };
}
