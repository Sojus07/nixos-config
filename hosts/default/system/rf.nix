{ config, lib, pkgs, ... }:

let
  gnss-sdr = pkgs.stdenv.mkDerivation rec {
    pname = "gnss-sdr";
    version = "0.0.20";

    src = pkgs.fetchFromGitHub {
      owner = "gnss-sdr";
      repo = "gnss-sdr";
      rev = "v${version}";
      sha256 = "sha256-kQv8I4dcWeRuAfYtD5EAAMwvfnOTi+QWDogUZb4M/qQ=";
    };

    nativeBuildInputs = with pkgs; [ cmake pkg-config python3 git ];
    buildInputs = with pkgs; [
      volk boost fftw protobuf pugixml
      gnuradio gnuradioPackages.osmosdr
      armadillo glog gflags spdlog
      python3Packages.mako blas lapack
      gnutls openssl zlib hdf5 matio
      libiio gtest orc
    ];

    cmakeFlags = [
      "-DCMAKE_BUILD_TYPE=Release"
      "-DCMAKE_INSTALL_LIBDIR=lib"
      "-DENABLE_OSMOSDR=ON"
      "-DENABLE_VOLK_GNSSSDR=ON"
      "-DENABLE_UNIT_TESTING=OFF"
      "-DENABLE_OWN_GLOG=OFF"
      "-DENABLE_OWN_ARMADILLO=OFF"
    ];
    enableParallelBuilding = true;

    buildPhase = ''
      runHook preBuild
      make volk_gnsssdr_module -j$NIX_BUILD_CORES
      make volk_gnsssdr_module_install -j$NIX_BUILD_CORES || true
      make -j$NIX_BUILD_CORES
      runHook postBuild
    '';  
    
    installPhase = ''
      runHook preInstall
      make install
      runHook postInstall
    '';
  };

  satdump = pkgs.stdenv.mkDerivation rec {
    pname = "satdump";
    version = "1.2.2";

    src = pkgs.fetchgit {
      url = "https://github.com/SatDump/SatDump.git";
      rev = version;
      sha256 = "sha256-QGegi5/geL5U3/ecc3hsdW+gp25UE9fOYVLFJUo/N50=";
    };

    nativeBuildInputs = with pkgs; [ cmake pkg-config ];
    buildInputs = with pkgs; [
      fftwFloat libpng libtiff jemalloc volk
      (nng.overrideAttrs (old: {
        cmakeFlags = old.cmakeFlags or [] ++ [ "-DBUILD_SHARED_LIBS=ON" ];
      }))
      rtl-sdr-librtlsdr hackrf airspy airspyhf
      glfw zenity zstd libad9361 libiio
    ];

    cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];
  };

  gr-gsm = pkgs.stdenv.mkDerivation rec {
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
  };
  
in
{
  hardware = {
    hackrf.enable = true;
    rtl-sdr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnuradio
    gnuradioPackages.lora_sdr
    gnuradioPackages.osmosdr
    gnuradioPackages.bladeRF
    multimon-ng
    sdrpp
    qsstv
    wsjtx
    osmo-hlr
    osmo-bts
    osmo-bsc
    osmo-sgsn
    osmo-ggsn
    kalibrate-hackrf
    srsran
    hackrf
    rtl-sdr
    rtl_433
    gsmlib
    libsrs2
    
    # build
    gnss-sdr
    satdump
    gr-gsm
  ];
  
}
