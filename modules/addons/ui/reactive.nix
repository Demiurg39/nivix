{
  config,
  inputs,
  mkPkgs,
  lib,
  ...
}: let
  cfg = config.addons.ui.reactive;
in {
  options.addons.ui.reactive.enable = lib.mkEnableOption "Enable reactive module";

  config = lib.mkIf cfg.enable {
    extraPlugins = [
      (mkPkgs "reactive" inputs.reactive)
    ];

    extraConfigLua = ''
      require("reactive").setup({
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true,
        },
      })
      '';
  };
}
