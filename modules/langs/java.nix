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

  config = lib.mkIf cfg.enable {
    plugins.nvim-jdtls = {
      enable = true;
      data = "~/.cache/jdtls/workspace";
      settings = {
        java = {
          signatureHelp = true;
          completion = true;
        };
      };
    };
  };
}
