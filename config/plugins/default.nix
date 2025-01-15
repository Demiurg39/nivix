{ ... }: {

  imports = [
    ./auto-session.nix
    ./completions.nix
    ./copilot.nix
    ./formatter.nix
    ./lsp.nix
    ./snacks.nix
    ./telescope.nix
    ./terminal.nix
  ];

  plugins = {
    trim.enable = true;
    todo-comments.enable = true;
    nvim-surround.enable = true;
    dressing.enable = true;
    lastplace.enable = true;
    oil.enable = true;

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
