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
            # Ensure modern-cv is available
            if [ ! -d "modern-cv" ]; then
              ${pkgs.git}/bin/git submodule update --init --recursive
            fi

            # Set up local typst package directory
            export TYPST_HOME="$PWD/.typst-home"
            mkdir -p "$TYPST_HOME/packages/local/modern-cv/0.7.0"
            cp -r modern-cv/* "$TYPST_HOME/packages/local/modern-cv/0.7.0/"
            
            export TYPST_ROOT="$PWD"
            exec ${pkgs.fish}/bin/fish
          '';
        };
      }
    );
} 