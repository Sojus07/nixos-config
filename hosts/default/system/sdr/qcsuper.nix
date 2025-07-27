{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "qcsuper";
  version = "2.0.1";

  src = pkgs.fetchFromGitHub {
    owner = "P1sec";
    repo = "QCSuper";
    rev = version;
    sha256 = "sha256-m75yoFO+NR5WyckmJfPtjXAajbDHB2PFBc7sznVQnw8=";
  };

  buildInputs = with pkgs; [
    python3 python3Packages.setuptools
    python3Packages.pyserial wireshark
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp qcsuper.py $out/bin/qcsuper
    chmod +x $out/bin/qcsuper
  '';
}
