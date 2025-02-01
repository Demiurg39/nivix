{ self, ... }: {
  # imports = self.lib.nivixlib.readFiles ./.;
  imports = [
    ./addons
    ./core
    ./integrations
    ./langs
    ./ui
  ];

  integrations.enable = false;
  langs.enable = true;
  addons = {
    enable = true;
    # completion.enable = true;
    # editor.enable = true;
    # lsp.enable = true;
    # utils.enable = true;
  };
  # ui.enable = true;
}
