{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
  };
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.bitcoin = pkgs.bitcoin;

      devShell.x86_64-linux =
        pkgs.mkShell { buildInputs = [ self.packages.x86_64-linux.bitcoin ]; };
   };
}

