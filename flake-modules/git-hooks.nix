{
  inputs,
  lib,
  ...
}: {
  imports = lib.optional (inputs.git-hooks-nix ? flakeModule) inputs.git-hooks-nix.flakeModule;

  perSystem = {
    lib,
    pkgs,
    ...
  }: lib.optionalAttrs (inputs.git-hooks-nix ? flakeModule) {
    pre-commit = {
      check.enable = false;
      settings.hooks = {
        alejandra.enable = true;
        deadnix = {
          enable = true;
          settings.edit = true;
        };
        luacheck.enable = true;
      };
    };
  };
}
