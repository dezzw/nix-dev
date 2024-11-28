{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, systems, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
      {

        devShells = forEachSystem
          (system:
            let
              pkgs = nixpkgs.legacyPackages.${system};
            in
              {
                default = pkgs.mkShell {
                  packages = with pkgs; [
                    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
                      debugpy
                    ]))

                  ];
                };            
              });
      };
}
