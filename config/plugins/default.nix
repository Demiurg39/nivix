{ self, ... }: {

  imports = self.lib.nivixlib.readFiles ./.;

  plugins = {
    dressing.enable = true;
    trim.enable = true;
    todo-comments.enable = true;
    nvim-surround.enable = true;
    lastplace.enable = true;
    oil.enable = true;
    web-devicons.enable = true;

    fidget = {
      enable = true;
      settings = {
        progress.display.progress_icon.pattern = "moon";
        notification.window = {
            relative = "editor";
            winblend = 0;
            border = "none";
        };
      };
    };
  };

}
