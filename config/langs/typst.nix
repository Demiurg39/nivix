{
  config,
  lib,
  ...
}: let
  cfg = config.langs.typst;
in {
  options.langs.typst = {
    enable = lib.mkEnableOption "Enable typst language module";
  };

  config = lib.mkIf cfg.enable {};
}
