{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    dot.url = "github:vahanbgs/dot/main";
    dot.inputs.nixpkgs.follows = "nixpkgs";

    cart.url = "github:vahanbgs/cart";
    cart.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      cart = inputs.cart.packages.${system}.default;
      dot = inputs.dot.packages.${system}.default;
      username = builtins.replaceStrings [ " " "\t" "\n" ] [ "" "" "" ] (
        builtins.readFile ./username.txt
      );
    in
    {
      homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];

        extraSpecialArgs = {
          inherit cart;
          inherit dot;
          inherit username;
          inherit pkgs-unstable;
        };
      };
    };
}
