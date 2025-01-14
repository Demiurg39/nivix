{ mkKey, lib, pkgs, ... }: {

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

}
