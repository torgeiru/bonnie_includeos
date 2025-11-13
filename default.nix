{
  withCcache ? false, # Enable ccache support
  smp ? false, # Enable SMP support

  includeos ? import (builtins.fetchGit {
        url = "https://github.com/torgeiru/IncludeOS";
        ref = "virtio_devices_benchmark";
      }) { inherit smp; inherit withCcache; },
}:
let
  stdenv = includeos.stdenv;
in
stdenv.mkDerivation {
  name = "Bonnie++ port to IncludeOS";
  version = "dev";

  src = ./src;

  inherit (includeos) nativeBuildInputs;

  buildInputs = [
    includeos
  ];

}
