{
  inputs,
  lib,
  self,
  ...
}: {
  imports = [
    ../variables
  ];

  perSystem = {
    pkgs,
    self',
    system,
    ...
  }: let
    nixvim' = inputs.nixvim.legacyPackages.${system};
    nixvimLib = inputs.nixvim.lib.${system};
    nixvimModule = {
      inherit pkgs;
      module = import ../config; # import the module directly
      extraSpecialArgs = {
          inherit inputs system self;
          # TODO: get rid off this legacy thing and substitute it with something more useful
          inherit (self) opts;
      } // import ../lib {inherit lib pkgs;};
    };
    nvim = nixvim'.makeNixvimWithModule nixvimModule;
  in {
    checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

    packages.default = nvim;
  };
}
