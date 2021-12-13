{ nixpkgs ? import ./nixpkgs.nix {}, compiler ? "ghc8107" }:
let
  pulsar-client-cpp = nixpkgs.callPackage ./native { };
in
  {
    pulsar-client-cpp = pulsar-client-cpp;
    pulsar-client-hs = nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./pulsar-client-hs.nix { inherit pulsar-client-cpp; };
  }
