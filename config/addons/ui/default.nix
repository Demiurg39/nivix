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
      beacon.enable = true;
      bufferline.enable = true;
      colorscheme.rose-pine.enable = true;
      dashboard.enable = true;
      gitsigns.enable = true;
      indent-line.enable = true;
      lualine.enable = true;
      noice.enable = true;
      reactive.enable = true;
      ufo.enable = true;
      which-key.enable = true;
    };
  };
}
