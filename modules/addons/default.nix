{
  config,
  lib,
  ...
}: let
  cfg = config.addons;
in {
  imports = [
    ./completion
    ./editor
    ./lsp
    ./ui
    ./utils
  ];

  options.addons.enable = lib.mkEnableOption "Enable plugins configurations";

  config = lib.mkIf cfg.enable {
    addons = {
      completion.enable = true;
      editor.enable = true;
      lsp.enable = true;
      ui.enable = true;
      utils.enable = true;
    };

    plugins = {
      dressing.enable = true;
      lastplace.enable = true;
      nvim-surround.enable = true;
      oil.enable = true;
      trim.enable = true;
      todo-comments.enable = true;
      web-devicons.enable = true;
    };
  };
}
