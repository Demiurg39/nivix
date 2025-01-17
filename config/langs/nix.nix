{ lib, pkgs, ... }: {

  plugins = {
    lsp = {
      enable = lib.mkDefault true;
      inlayHints = lib.mkDefault true;
      servers.nil_ls = {
        enable = true;
        settings.formatting.command = [ "${lib.getExe pkgs.nixpkgs-fmt}" ];
      };
    };
  };

  extraFiles."ftplugin/nix.lua".text = # lua
    ''
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    '';

}
