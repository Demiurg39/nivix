{
  config,
  lib,
  ...
}: let
  cfg = config.langs.java;
in {
  options.langs.java = {
    enable = lib.mkEnableOption "Enable java language module";
  };

  config = lib.mkIf cfg.enable {};
}
