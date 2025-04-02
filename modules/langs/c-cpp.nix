{
  config,
  lib,
  ...
}: let
  cfg = config.langs.c-cpp;
in {
  options.langs.c-cpp = {
    enable = lib.mkEnableOption "Enable C language module";
  };

  config = lib.mkIf cfg.enable {
    plugins.lsp.servers = {
      ccls.enable = true;
      clangd = {
        enable = true;
        extraOptions = {
          capabilities = {
            offsetEncoding = [ "utf-8" ];
          };
          init_options = {
            usePlaceholders = true;
            completeUnimported = true;
            clangdFileStatus = true;
          };
        };
        cmd = [
          "clangd"
          "--background-index"
          "--clang-tidy"
          "--header-insertion=iwyu"
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=llvm"
        ];
      };
    };
  };
}
