{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons.ui;
in {
  imports = self.lib.nivixlib.readFiles ./.;

  options.addons.ui.enable = lib.mkEnableOption "Enable ui module";

  config = lib.mkIf cfg.enable {
    addons.ui = {
      which-key.enable = true;
    };
  };
}
