{
  config,
  lib,
  ...
}: let
  cfg = config.langs.lua;
in {
  options.langs.lua = {
    enable = lib.mkEnableOption "Enable lua language module";
  };

  config = lib.mkIf cfg.enable {};
}
