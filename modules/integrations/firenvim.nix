{
  config,
  lib,
  ...
}: let
  cfg = config.integrations.firenvim;
in {
  options.integrations.firenvim = {
    enable = lib.mkEnableOption "Enable firenvim integrations module";
  };

  config = lib.mkIf cfg.enable {};
}
