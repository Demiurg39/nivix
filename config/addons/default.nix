{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons;
in {
  imports = self.lib.nivixlib.readFiles ./.;

  options.addons.enable = lib.mkEnableOption "Enable plugins configurations";

  config = lib.mkIf cfg.enable {
    plugins = {
      dressing.enable = true;
      lastplace.enable = true;
      nvim-surround.enable = true;
      oil.enable = true;
      trim.enable = true;
      todo-comments.enable = true;
      web-devicons.enable = true;

      fidget = {
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
  };
}
