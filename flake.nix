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

            # Create a local package build in the project
            echo "Building local package..."
            rm -rf ./.package-build
            mkdir -p ./.package-build
            cp -r modern-cv/* ./.package-build/
            
            # Create system package directory if it doesn't exist
            SYSTEM_PKG_DIR="$HOME/Library/Application Support/typst/packages/local/modern-cv/0.7.0"
            mkdir -p "$(dirname "$SYSTEM_PKG_DIR")"
            
            # Link our local build to the system path
            rm -rf "$SYSTEM_PKG_DIR" 2>/dev/null
            ln -sf "$PWD/.package-build" "$SYSTEM_PKG_DIR"
            
            echo "Package installed at: $SYSTEM_PKG_DIR"
            
            exec ${pkgs.fish}/bin/fish
          '';
        };
      }
    );
} 