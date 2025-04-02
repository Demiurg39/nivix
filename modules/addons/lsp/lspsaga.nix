{
  config,
  opts,
  lib,
  ...
}: let
  cfg = config.addons.lsp.lspsaga;
in {
  options.addons.lsp.lspsaga.enable = lib.mkEnableOption "Enable lspsaga module";

  config = lib.mkIf cfg.enable {
    plugins.lspsaga = {
      enable = true;
      lightbulb = {
        enable = false;
        virtualText = false;
      };
      outline.keys.jump = "<cr>";
      hover.openCmd = "!firefox";
      ui.border = "${opts.border}";
      scrollPreview = {
        scrollDown = "<C-j>";
        scrollUp = "<C-k>";
      };
    };
  };
}
