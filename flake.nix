{
  description = "NixOS configuration tree";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
            
      coreArgs = { inherit inputs unstable; };
      
      hmConfig = hostName: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit unstable; };
        home-manager.backupFileExtension = "backup";
        home-manager.users.juan = import ./hosts/${hostName}/home.nix;
      };
    in {
    nixosConfigurations = {
      # vm01
      vm01 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = coreArgs;
        modules = [
          ./hosts/vm01/configuration.nix
          home-manager.nixosModules.home-manager
          (hmConfig "vm01")
        ];
      };

      # ws01
      ws01 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = coreArgs;
        modules = [
          ./hosts/ws01/configuration.nix
          home-manager.nixosModules.home-manager
          (hmConfig "ws01")
        ];
      };
    };
  };
}