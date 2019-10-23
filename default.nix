let
    pkgs = import ./nix/pkgs.nix {};
in
    pkgs.stdenv.mkDerivation {
        name = "mmed";
        buildInputs = [pkgs.makeWrapper];
        phases = ["unpackPhase" "buildPhase" "installPhase"];
        unpackPhase = ''
            cp --recursive ${./src} src
        '';
        buildPhase = ''
            true
        '';
        installPhase = ''
            mkdir --parents $out/{bin,share/app}
            makeWrapper ${pkgs.electron}/bin/electron $out/bin/mmed \
                --add-flags $out/share/app
            cp src/index.html $out/share/app/index.html
            cp src/index.js $out/share/app/index.js
        '';
    }
