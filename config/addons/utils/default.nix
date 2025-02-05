{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons.utils;
in {
  options.addons.utils.enable = lib.mkEnableOption "Enable utils module";

  imports = self.lib.nivixlib.readFiles ./.;

  config = lib.mkIf cfg.enable {
    addons.utils = {
      auto-session.enable = true;
      snacks.enable = true;
      snacks.terminal.enable = true;
    };
  };
}
