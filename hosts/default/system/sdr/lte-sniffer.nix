{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "lte-sniffer";
  version = "LTESniffer-v2.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "SysSec-KAIST";
    repo = "LTESniffer";
    rev = "918d1a3fea4d7633aa8eb170a740916cf21da171";
    sha256 = "sha256-kbFvpHcqlEpoLkc206jJBLzAFuBGjvDLO9uRaG4+PqE=";
  };

  cmnalib = pkgs.fetchgit {
    url = "https://github.com/falkenber9/c-mnalib.git";
    rev = "117c7047ccbec4deae5444cb5b69bdae01ddd175";
    sha256 = "sha256-Rnr9GOv7yn3+bH+HA6htx5EKufC1wNyRzZvUu3pDn/w=";
  };

  nativeBuildInputs = with pkgs; [ cmake git pkg-config ];
  buildInputs = with pkgs; [
    glib libudev-zero boost gnutls libgnurl nng
    libsForQt5.qt5.qtdeclarative volk fftwFloat
    curl libtiff glfw mkl
  ];

  patchPhase = ''
    runHook prePatch

    echo "[INFO] Removing ExternalProject_Add(cmnalib) from cmnalib.CMakeLists.txt.in"
    sed -i '/ExternalProject_Add(cmnalib/d' external/cmake/cmnalib.CMakeLists.txt.in

    runHook postPatch
  '';

  cmakeFlags = [
    "-DCMNALIB_SRC_DIR=${cmnalib}"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  buildPhase = ''
    runHook preBuild

    mkdir -p cmnalib-src
    cp -r ${cmnalib}/* cmnalib-src/

    cmake -S . -B build $cmakeFlags
    cmake --build build -j$NIX_BUILD_CORES

    runHook postBuild
  '';


  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp -v build/apps/* $out/bin/

    runHook postInstall
  '';

  dontWrapQtApps = true;

  meta = with pkgs.lib; {
    description = "Passive LTE Sniffer based on SysSec-KAIST's LTESniffer project";
    homepage = "https://github.com/SysSec-KAIST/LTESniffer";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ sojus07 ];
    platforms = platforms.linux;
  };
}
