{ mkDerivation, base, bytestring, lib, pulsar-client-hs, resourcet
, transformers
}:
mkDerivation {
  pname = "pulsar-client-hs-examples";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring pulsar-client-hs resourcet transformers
  ];
  license = lib.licenses.asl20;
}
