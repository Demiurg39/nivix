{
  config,
  lib,
  ...
}: let
  cfg = config.addons.ui.indent-line;
in {
  options.addons.ui.indent-line.enable = lib.mkEnableOption "Enable indent-line module";

  config = lib.mkIf cfg.enable {
    plugins.snacks.settings.indent = {
      enable = true;
      animate.duration = {
        step = 60;
        total = 500;
      };
    };
  };
}
