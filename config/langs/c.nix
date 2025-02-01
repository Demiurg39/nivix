{
  config,
  lib,
  ...
}: let
  cfg = config.langs.c;
in {
  options.langs.c = {
    enable = lib.mkEnableOption "Enable C language module";
  };

  config = lib.mkIf cfg.enable {};
}
