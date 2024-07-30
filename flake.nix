{
  description = "jspidell's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix.url = "github:danth/stylix";

    nixvim.url = "github:nix-community/nixvim";

    # warcraftlogs-uploader.url = "git+https://github.com/RPGLogs/Uploaders-warcraftlogs";

    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      nix-flatpak,
      stylix,
      hyprland,
      nixvim,
      xremap-flake,
      # warcraftlogs-uploader,
      ...
    }@inputs:
    let
      user = "jspidell";
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs user;
          };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix
            nixvim.nixosModules.nixvim
            xremap-flake.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
            }

            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc-ssd

            ./nixos/configuration.nix
          ];
        };
      };
    };
}
