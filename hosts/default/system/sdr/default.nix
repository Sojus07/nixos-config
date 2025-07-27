{ config, lib, pkgs, ... }:

let
  gnss-sdr     = import ./gnss-sdr.nix     { inherit pkgs; };
  satdump      = import ./satdump.nix      { inherit pkgs; };
  gr-gsm       = import ./gr-gsm.nix       { inherit pkgs; };
  lte-sniffer  = import ./lte-sniffer.nix  { inherit pkgs; };
  qcsuper      = import ./qcsuper.nix      { inherit pkgs; };
in
{
  hardware = {
    hackrf.enable = true;
    rtl-sdr.enable = true;
  };

  services.sdrplayApi.enable = true;

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
    soapyhackrf

    gnss-sdr
    #satdump
    gr-gsm
    #lte-sniffer
    qcsuper
  ];
}
