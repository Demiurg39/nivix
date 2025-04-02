{
  config,
  lib,
  ...
}: let
  cfg = config.addons.ui.colorscheme;
in {
  options.addons.ui.colorscheme = {
    rose-pine.enable = lib.mkEnableOption "Enable rose-pine colorscheme";
  };

  config = {
    colorschemes.rose-pine.enable = cfg.rose-pine.enable == true;
  };

}
