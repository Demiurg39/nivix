{
  config,
  lib,
  ...
}: let
  cfg = config.addons.utils.colorizer;
in {
  options.addons.utils.colorizer.enable = lib.mkEnableOption "Enable colorizer module";

  config = lib.mkIf cfg.enable {
    plugins.colorizer = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
    };
  };
}
