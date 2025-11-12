{
  description = "My CV built with typst";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # Pin an older nixpkgs for Typst 0.13.1 to avoid template breakage on 0.14
    nixpkgs-typst013.url = "github:NixOS/nixpkgs/648f70160c03151bc2121d179291337ad6bc564b";
  };

  outputs = { self, nixpkgs, nixpkgs-typst013, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pkgsTypst013 = nixpkgs-typst013.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Use Typst 0.13.1 for compatibility with linguify 0.4.1
            pkgsTypst013.typst
            just
            curl
            unzip
            fontconfig
          ];
          
          shellHook = ''
            # Ensure modern-cv submodule is present
            if [ ! -d "modern-cv" ]; then
              ${pkgs.git}/bin/git submodule update --init --recursive
            fi

            echo "Building local package..."
            rm -rf ./.package-build
            mkdir -p ./.package-build
            cp -r modern-cv/* ./.package-build/

            # OS-aware Typst local package dir
            case "$(uname -s)" in
              Darwin)
                SYSTEM_PKG_DIR="$HOME/Library/Application Support/typst/packages/local/modern-cv/0.7.0"
                ;;
              Linux)
                SYSTEM_PKG_DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/modern-cv/0.7.0"
                ;;
              *)
                SYSTEM_PKG_DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/modern-cv/0.7.0"
                ;;
            esac
            mkdir -p "$(dirname "$SYSTEM_PKG_DIR")"
            rm -rf "$SYSTEM_PKG_DIR" 2>/dev/null || true
            ln -sf "$PWD/.package-build" "$SYSTEM_PKG_DIR"
            echo "Package installed at: $SYSTEM_PKG_DIR"

            # Fonts dir inside repo to keep sandboxed
            FONTS_DIR="$PWD/.fonts"
            mkdir -p "$FONTS_DIR"

            # Download fonts if needed (best-effort)
            if [ ! -d "$FONTS_DIR/source-sans-pro" ]; then
              echo "Downloading Source Sans Pro..."
              mkdir -p "$FONTS_DIR/source-sans-pro"
              ${pkgs.curl}/bin/curl -L https://github.com/adobe-fonts/source-sans-pro/archive/refs/tags/3.046R.zip -o "$FONTS_DIR/source-sans.zip" || true
              ${pkgs.unzip}/bin/unzip -o "$FONTS_DIR/source-sans.zip" -d "$FONTS_DIR/source-sans-pro" >/dev/null 2>&1 || true
              rm -f "$FONTS_DIR/source-sans.zip" || true
            fi

            if [ ! -d "$FONTS_DIR/font-awesome" ]; then
              echo "Downloading Font Awesome..."
              mkdir -p "$FONTS_DIR/font-awesome"
              ${pkgs.curl}/bin/curl -L https://use.fontawesome.com/releases/v6.4.2/fontawesome-free-6.4.2-desktop.zip -o "$FONTS_DIR/fontawesome.zip" || true
              ${pkgs.unzip}/bin/unzip -o "$FONTS_DIR/fontawesome.zip" -d "$FONTS_DIR/font-awesome" >/dev/null 2>&1 || true
              rm -f "$FONTS_DIR/fontawesome.zip" || true
            fi

            # Fontconfig: include our fonts + common Linux paths; macOS dirs are harmless elsewhere
            export FONTCONFIG_FILE=$(mktemp)
            cat > "$FONTCONFIG_FILE" <<EOF
            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
              <dir>$FONTS_DIR/source-sans-pro</dir>
              <dir>$FONTS_DIR/font-awesome</dir>
              <dir>~/.local/share/fonts</dir>
              <dir>/usr/share/fonts</dir>
              <dir>/usr/local/share/fonts</dir>
              <dir>/System/Library/Fonts</dir>
              <dir>/Library/Fonts</dir>
              <dir>~/Library/Fonts</dir>
            </fontconfig>
            EOF
            echo "Fontconfig configured: $FONTCONFIG_FILE"

            # Refresh caches silently
            ${pkgs.fontconfig}/bin/fc-cache -f >/dev/null 2>&1 || true

            echo "Dev shell ready. Run: typst compile resume.typ"
          '';
        };
      }
    );
} 
