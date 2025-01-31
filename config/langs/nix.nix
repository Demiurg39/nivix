{
  lib,
  pkgs,
  self,
  ...
}: let
  flake = ''(builtins.getFlake "${self}")'';
  system = ''''${builtins.currentSystem}'';
in {
  plugins = {
    nix.enable = true;
    lsp = {
      enable = lib.mkDefault true;
      inlayHints = lib.mkDefault true;
      servers.nixd = {
        enable = true;
        settings.nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
        settings.formatting.command = ["${lib.getExe pkgs.alejandra}"];
        settings.options.nixvim.expr = ''${flake}.packages.${system}.default.options'';
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
