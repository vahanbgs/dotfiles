{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    dot.url = "github:vahanbgs/dot/main";
    dot.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    input:
    let
      system = "x86_64-linux";
      pkgs = input.nixpkgs.legacyPackages.${system};
      dot = input.dot.defaultPackage.${system};
      username = builtins.replaceStrings [ " " "\t" "\n" ] [ "" "" "" ] (
        builtins.readFile ./username.txt
      );
    in
    {
      homeConfigurations.${username} = input.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];

        extraSpecialArgs = {
          inherit dot;
          inherit username;
        };
      };
    };
}
