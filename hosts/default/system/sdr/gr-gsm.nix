{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "gr-gsm";
  version = "porting_to_3.11";

  src = pkgs.fetchFromGitHub {
    owner = "ptrkrysik";
    repo = "gr-gsm";
    rev = "porting_to_3.11";
    sha256 = "sha256-ILw1n0qdqcqJsuWQ3g1zNP+z2OlJ6sq+AY8LC1lTDJg=";
  };

  nativeBuildInputs = with pkgs; [
    cmake pkg-config swig doxygen
    python3 python3Packages.numpy python3Packages.pybind11 python3Packages.pygccxml
  ];
  buildInputs = with pkgs; [
    python3 python3Packages.numpy python3Packages.pybind11 python3Packages.pygccxml
    gnuradio gnuradioPackages.osmosdr volk
    fftw boost cppunit libpcap libosmocore
    log4cpp gmpxx mpir spdlog
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_PREFIX_PATH=${pkgs.gnuradio}/lib/cmake"
  ];
  enableParallelBuilding = true;

  buildPhase = ''
    runHook preBuild
    make
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make install
    mkdir -p $out/bin
    cp -v $src/apps/grgsm_* $out/bin/
    runHook postInstall
  '';
}
