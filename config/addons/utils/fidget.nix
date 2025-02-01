{ ... }: {
  plugins.fidget = {
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
}
