{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc8107" }:
let
  pkgs = import ./default.nix { inherit nixpkgs compiler; };

  easy-hls-src = builtins.fetchTarball { url = "https://github.com/jkachmar/easy-hls-nix/archive/7c123399ef8a67dc0e505d9cf7f2c7f64f1cd847.tar.gz"; };

  easy-hls = nixpkgs.callPackage easy-hls-src {
    ghcVersions = [ nixpkgs.haskellPackages.ghc.version ];
  };
in
  nixpkgs.mkShell {
    buildInputs = [
      easy-hls
      pkgs.pulsar-client-cpp
      nixpkgs.haskellPackages.ghcid
      nixpkgs.haskell.compiler.${compiler}
      nixpkgs.haskellPackages.c2hsc
      nixpkgs.haskellPackages.cabal-install
      nixpkgs.haskellPackages.hsc2hs
    ];
  }
