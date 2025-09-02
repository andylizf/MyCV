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
            curl
            unzip
            fontconfig
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
            
            # Set up fonts directory
            FONTS_DIR="$PWD/.fonts"
            mkdir -p "$FONTS_DIR"
            
            # Download fonts if needed
            if [ ! -d "$FONTS_DIR/roboto" ]; then
              echo "Downloading Roboto..."
              mkdir -p "$FONTS_DIR/roboto"
              ${pkgs.curl}/bin/curl -L https://fonts.google.com/download?family=Roboto -o "$FONTS_DIR/roboto.zip"
              ${pkgs.unzip}/bin/unzip -o "$FONTS_DIR/roboto.zip" -d "$FONTS_DIR/roboto"
              rm "$FONTS_DIR/roboto.zip"
            fi
            
            if [ ! -d "$FONTS_DIR/source-sans-pro" ]; then
              echo "Downloading Source Sans Pro..."
              mkdir -p "$FONTS_DIR/source-sans-pro"
              ${pkgs.curl}/bin/curl -L https://github.com/adobe-fonts/source-sans-pro/archive/refs/tags/3.046R.zip -o "$FONTS_DIR/source-sans.zip"
              ${pkgs.unzip}/bin/unzip -o "$FONTS_DIR/source-sans.zip" -d "$FONTS_DIR/source-sans-pro"
              rm "$FONTS_DIR/source-sans.zip"
            fi
            
            if [ ! -d "$FONTS_DIR/font-awesome" ]; then
              echo "Downloading Font Awesome..."
              mkdir -p "$FONTS_DIR/font-awesome"
              ${pkgs.curl}/bin/curl -L https://use.fontawesome.com/releases/v6.4.2/fontawesome-free-6.4.2-desktop.zip -o "$FONTS_DIR/fontawesome.zip"
              ${pkgs.unzip}/bin/unzip -o "$FONTS_DIR/fontawesome.zip" -d "$FONTS_DIR/font-awesome"
              rm "$FONTS_DIR/fontawesome.zip"
            fi
            
            # Create a custom fontconfig file
            export FONTCONFIG_FILE=$(mktemp)
            cat > $FONTCONFIG_FILE <<EOF
            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
              <!-- Add our downloaded fonts -->
              <dir>$FONTS_DIR/roboto</dir>
              <dir>$FONTS_DIR/source-sans-pro</dir>
              <dir>$FONTS_DIR/font-awesome</dir>
              <!-- System fonts -->
              <dir>/System/Library/Fonts</dir>
              <dir>/Library/Fonts</dir>
              <dir>~/Library/Fonts</dir>
            </fontconfig>
            EOF
            
            echo "Font configuration set up at: $FONTCONFIG_FILE"
            
            # Create symlinks to specific fonts in the user's font directory
            USER_FONT_DIR="$HOME/Library/Fonts"
            mkdir -p "$USER_FONT_DIR"
            
            # Make symlinks to Font Awesome
            if [ -d "$FONTS_DIR/font-awesome" ]; then
              find "$FONTS_DIR/font-awesome" -name "*.ttf" -o -name "*.otf" | while read font; do
                base=$(basename "$font")
                ln -sf "$font" "$USER_FONT_DIR/$base"
              done
              echo "Font Awesome symlinks created in $USER_FONT_DIR"
            fi
            
            # Ensure fc-cache is run to recognize new fonts
            ${pkgs.fontconfig}/bin/fc-cache -fv
            
            exec ${pkgs.fish}/bin/fish
          '';
        };
      }
    );
} 