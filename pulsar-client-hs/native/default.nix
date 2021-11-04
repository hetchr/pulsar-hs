# Taken from: https://github.com/CorbanR/nixpkgs/blob/a00761ad44a3ce8b69ba525fee4911ba5f91ce0c/pkgs/development/libraries/libpulsar/default.nix
{ stdenv
, lib
, pkgs
, fetchurl
, version ? "2.8.1"
, sha512 ? "23i95k6gs5lh6gw6v6hybv6z8rfzc3mfgj2agb6iicad9ia2sf46wr3rqzi9bdhp0c990vcvn72bkz13i0hnh1hj5gnwqin339a2g0x"
, boost17x
, clang
, llvmPackages
, cmake
, curl
, gcc
, jsoncpp
, log4cxx
, openssl
, pkgconfig
, protobuf
, python37
, snappy
, zlib
, zstd}:

let
  # Not really sure why I need to do this.. If I call clang-tools without the override it defaults to clang_10
  clang-tools = pkgs.clang-tools.override {inherit stdenv llvmPackages;};
in
  stdenv.mkDerivation rec {
    pname = "pulsar-client-cpp";
    inherit version;

    src = fetchurl {
      inherit sha512;
      url = "https://archive.apache.org/dist/pulsar/pulsar-${version}/apache-pulsar-${version}-src.tar.gz";
    };

    sourceRoot = "apache-pulsar-${version}-src/pulsar-client-cpp";

    # python37 used in cmake script to calculate some values
    # clang-tools needed for clang-format etc
    nativeBuildInputs = [ cmake python37 pkgconfig ]
    ++ lib.optional stdenv.isDarwin [ clang clang-tools ]
    ++ lib.optional stdenv.isLinux [ gcc clang-tools ];

    buildInputs = [ boost17x jsoncpp log4cxx openssl protobuf snappy zstd curl zlib ];

    # since we cant expand $out in cmakeFlags
    preConfigure = ''cmakeFlags="$cmakeFlags -DCMAKE_INSTALL_LIBDIR=$out/lib"'';

    cmakeFlags = [
      "-DBUILD_TESTS=OFF"
      "-DBUILD_PYTHON_WRAPPER=OFF"
      "-DClangTools_PATH=${clang-tools}/bin"
    ];

    enableParallelBuilding = true;

    patches = [ ./reader_configuration_includes.diff ];

    meta = with lib; {
      homepage = "https://pulsar.apache.org/docs/en/client-libraries-cpp";
      description = "Apache Pulsar C++ library";

      platforms = [ "x86_64-darwin" "x86_64-linux" ];
      license = licenses.asl20;
      maintainers = [];
    };
  }
