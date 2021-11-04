# ( import ./. ).haskellPackages.shellFor {
#   packages = pkgs: [pkgs.pulsar-client-hs];
# }
{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc8107" }:
let
  pkgs = import ./default.nix { inherit nixpkgs compiler; };
in
  nixpkgs.mkShell {
    buildInputs = [
      # pkgs.pulsar-client-hs
      pkgs.pulsar-client-cpp
      # nixpkgs.haskellPackages.bindings-DSL
      nixpkgs.haskellPackages.ghcid
      nixpkgs.haskell.compiler.${compiler}
      nixpkgs.haskellPackages.c2hsc
      nixpkgs.haskellPackages.cabal-install
      nixpkgs.haskellPackages.hsc2hs
    ];
  }
