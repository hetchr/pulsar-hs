{ mkDerivation, base, lib, pulsar-client-cpp, bindings-DSL, bytestring, containers, resourcet, transformers }:
mkDerivation {
  pname = "pulsar-client-hs";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  configureFlags = [ "--extra-include-dirs=${pulsar-client-cpp}/include" ];
  executableHaskellDepends = [ base bindings-DSL bytestring containers resourcet transformers ];
  librarySystemDepends = [ pulsar-client-cpp ];
  libraryPkgconfigDepends = [ pulsar-client-cpp ];
  license = lib.licenses.asl20;
}
