{
  description = "Nivix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    git-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Plugins
    beacon.url = "github:danilamihailov/beacon.nvim";
    beacon.flake = false;

    reactive.url = "github:rasulomaroff/reactive.nvim";
    reactive.flake = false;

    typst-preview.url = "github:chomosuke/typst-preview.nvim";
    typst-preview.flake = false;
  };

  outputs = { flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [./flake-modules];
    };
}
