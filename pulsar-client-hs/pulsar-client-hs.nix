{ mkDerivation, base, lib, pulsar-client-cpp, bindings-DSL, bytestring, containers, deepseq, resourcet, transformers, unliftio }:
mkDerivation {
  pname = "pulsar-client-hs";
  version = "1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = false;
  configureFlags = [ "--extra-include-dirs=${pulsar-client-cpp}/include" ];
  executableHaskellDepends = [ base bindings-DSL bytestring containers deepseq resourcet transformers unliftio ];
  librarySystemDepends = [ pulsar-client-cpp ];
  libraryPkgconfigDepends = [ pulsar-client-cpp ];
  license = lib.licenses.bsd2;
}
