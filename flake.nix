{
  description = "My CV built with typst";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Create a derivation for modern-cv package
        modern-cv-pkg = pkgs.stdenv.mkDerivation {
          name = "modern-cv";
          version = "0.7.0";
          src = ./modern-cv;
          
          buildPhase = "true"; # No build needed
          
          installPhase = ''
            mkdir -p $out/packages/local/modern-cv/0.7.0
            cp -r ./* $out/packages/local/modern-cv/0.7.0/
          '';
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            typst
            just
            # Fonts
            roboto
            source-sans-pro
            font-awesome
          ];
          
          shellHook = ''
            export TYPST_HOME="${modern-cv-pkg}"
            export TYPST_ROOT="$PWD"
            exec ${pkgs.fish}/bin/fish
          '';
        };
      }
    );
} 