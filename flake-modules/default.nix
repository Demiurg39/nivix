{
  inputs,
  lib,
  self,
  ...
}: {
  imports = [
    ./git-hooks.nix
    ./lib.nix
    ./options.nix
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
      module = import ../modules; # import the module directly
      extraSpecialArgs = {
          inherit inputs system self;
          inherit (self) opts;
      } // import ../lib {inherit lib pkgs;};
    };
    nixvim = nixvim'.makeNixvimWithModule nixvimModule;
  in {
    checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

    packages.default = nixvim;
  };
}
