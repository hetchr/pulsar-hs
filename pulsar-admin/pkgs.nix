{ compiler ? "ghc8106" }:

let
  pkgs = import (
    builtins.fetchTarball {
      name   = "nixos-unstable-2021-09-03";
      url    = "https://github.com/NixOS/nixpkgs/archive/8a2ec31e224de9461390cdd03e5e0b0290cdad0b.tar.gz";
      sha256 = "0w8sl1dwmvng2bd03byiaz8j9a9hlvv8n16641m8m5dd06dyqli7";
    }
  ) {};

  hp = pkgs.haskell.packages.${compiler}.override {
    # overrides = newPkgs: oldPkgs: rec {
    #   network = newPkgs.network_3_1_2_2;
    # };
  };
in
{
  pkgs = pkgs;
  hp = hp;
}
