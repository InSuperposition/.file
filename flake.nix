{
  description = "A flake with git, git-lfs, and starship";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        packages = {
          git = pkgs.git;
          git-lfs = pkgs.git-lfs;
          starship = pkgs.starship;
        };

        defaultPackage = self.packages.${system}.git;

        apps = {
          git = {
            type = "app";
            program = "${self.packages.${system}.git}/bin/git";
          };
        };

        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.git pkgs.git-lfs pkgs.starship ];
        };
      }
    );
}