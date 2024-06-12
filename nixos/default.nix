# default.nix
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./common/environment.nix
    ./common/hardware.nix
    ./common/programs.nix
    ./common/services.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  users = {
    defaultUserShell = pkgs.fish;

    users.jspidell = {
      isNormalUser = true;
      extraGroups = ["wheel" "audio" "networkmanager"];
    };
  };

  nix.settings.experimental-features = "nix-command flakes";

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos";

  time.timeZone = "America/Los_Angeles";

  hardware = {
    pulseaudio.enable = false;
    openrazer.enable = true;

    opengl = {
      # TODO
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [amdvlk];
    };
  };

  security = {
    rtkit.enable = true; # TODO

    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk]; # TODO
  xdg.portal.config.common.default = "gtk"; # TODO

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      jspidell = import ../home/home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
