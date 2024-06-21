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

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    settings.experimental-features = "nix-command flakes";
    gc.automatic = true;
  };

  users = {
    defaultUserShell = pkgs.bash;
    users.jspidell = {
      isNormalUser = true;
      extraGroups = ["wheel" "audio" "networkmanager"];
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos";

  time.timeZone = "America/Los_Angeles";

  hardware = {
    pulseaudio.enable = false;
    openrazer.enable = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [amdvlk];
    };
  };

  sound.enable = true;

  security = {
    rtkit.enable = true; # TODO

    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  stylix = {
    enable = true;
    image = ../../wallpapers/a_city_with_a_pyramid_over_it.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
