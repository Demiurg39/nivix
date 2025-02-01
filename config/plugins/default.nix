{ self, ... }: {

  imports = self.lib.nivixlib.readFiles ./.;

  plugins = {
    dressing.enable = true;
    lastplace.enable = true;
    nvim-surround.enable = true;
    oil.enable = true;
    trim.enable = true;
    todo-comments.enable = true;
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
