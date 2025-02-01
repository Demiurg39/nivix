{
  config,
  self,
  pkgs,
  lib,
  ...
}: let
  cfg = config.langs.nix;
  flake = ''(builtins.getFlake "${self}")'';
  system = ''''${builtins.currentSystem}'';
in {
  options.langs.nix = {
    enable = lib.mkEnableOption "Enable nix language module";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      nix.enable = true;
      lsp = {
        enable = lib.mkForce true;
        inlayHints = true;
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
  };
}
