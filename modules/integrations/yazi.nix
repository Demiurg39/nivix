{
  config,
  lib,
  ...
}: let
  cfg = config.integrations.yazi;
in {
  options.integrations.yazi = {
    enable = lib.mkEnableOption "Enable yazi integrations module";
  };

  config = lib.mkIf cfg.enable {
    plugins.yazi = {
      enable = true;
    };
  };
}
