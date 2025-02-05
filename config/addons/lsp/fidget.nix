{
  config,
  lib,
  ...
}: let
  cfg = config.addons.lsp.fidget;
in {
  options.addons.lsp.fidget.enable = lib.mkEnableOption "Enable fidget module";

  config = lib.mkIf cfg.enable {
    plugins.fidget = {
      enable = true;
      settings = {
        progress.display.progress_icon.pattern = "moon";
        notification.window = {
          relative = "editor";
          winblend = 0;
          border = "none";
        };
      };
    };
  };
}
