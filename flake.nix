{

  description = "Nivix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    beacon.url = "github:danilamihailov/beacon.nvim";
    beacon.flake = false;
  };

  outputs ={ nixvim, flake-parts, self, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {

      imports = [ ./variables ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { lib, pkgs, self', system, ... }: let
          nixvimLib = nixvim.lib.${system} ;
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config; # import the module directly
            extraSpecialArgs = {
              inherit inputs self;
              inherit (self) opts;
            } // import ./lib { inherit lib pkgs; } ;
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in {

            # Run `nix flake check .` to verify that your config is not broken
          checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

          # Lets you run `nix run .` to start nixvim
          packages.default = nvim;

        };
    };

}
