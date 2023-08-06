{ self, nixpkgs, inputs, user, host }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  laptop = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user host; };
    modules = [
      ./system.nix
      ./laptop
    ] ++ [
      inputs.home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              ./laptop/home.nix
            ] ++ [
              inputs.hyprland.homeManagerModules.default
            ];
          };
        };
      }
    ];
  };
}
