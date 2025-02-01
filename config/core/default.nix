{
  opts,
  icons,
  self,
  ...
}: {
  imports = self.lib.nivixlib.readFiles ./.;

  enableMan = true;
  viAlias = true;
  vimAlias = true;

  globals = {
    mapleader = " ";
    floating_window_options = {
      border = "${opts.border}";
      inherit (opts) winblend;
    };
  };

  plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
  };
}
