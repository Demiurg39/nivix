{ opts, lib, pkgs, self, ... }: {

  plugins = {
    lsp = {
      enable = lib.mkDefault true;
      inlayHints = lib.mkDefault true;
      servers.nixd = {
        enable = true;
        settings.nixpkgs.expr = "import <nixpkgs> { }";
        settings.formatting.command = ["${lib.getExe pkgs.alejandra}"];
        settings.options = {
            nixvim.expr = ''(builtins.getFlake "${self}").packages.${pkgs.system}.default.options'';
          } // lib.optionalAttrs opts.nixos.enable {
            nixos.expr = ''(builtins.getFlake ${opts.nixos.flake}).nixosConfiguration.${opts.nixos.hostname}.options'';
          };
      };
    };
  };

  extraFiles."ftplugin/nix.lua".text =
    # lua
    ''
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    '';

}
