{
  config,
  lib,
  ...
}: let
  cfg = config.integrations.neovide;
in {
  options.integrations.neovide = {
    enable = lib.mkEnableOption "Enable neovide integrations module";
  };

  config = lib.mkIf cfg.enable {};
}
