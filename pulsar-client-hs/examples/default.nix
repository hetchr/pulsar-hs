{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc8107" }:
let
  pkgs = import ../default.nix { inherit nixpkgs compiler; };
in
  {
    pulsar-client-hs-examples = nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./pulsar-client-hs-examples.nix { pulsar-client-hs = pkgs.pulsar-client-hs; };
  }
