{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.integrations;
in {
  imports = self.lib.nivixlib.readFiles ./.;

  options.integrations = {
    enable = lib.mkEnableOption "Enable integrations module";
  };

  config = lib.mkIf cfg.enable {
    integrations = {
      firenvim.enable = true;
      neovide.enable = true;
      yazi.enable = true;
    };
  };
}
