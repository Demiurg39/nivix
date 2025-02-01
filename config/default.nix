{
  self,
  lib,
  ...
}: {
  # imports = self.lib.nivixlib.readFiles ./.;
  imports = [
    ./core
    ./integrations
    ./langs
    ./plugins
    ./ui
  ];

  integrations.enable = false;
  langs.enable = true;
  # plugins = {
  #   enable = true;
  #   completion.enable = true;
  #   editor.enable = true;
  #   lsp.enable = true;
  #   utils.enable = true;
  # };
  # ui.enable = true;
}
