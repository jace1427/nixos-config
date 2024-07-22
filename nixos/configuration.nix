# configuration.nix
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./common/default.nix

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
    settings.warn-dirty = false;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.jspidell = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "audio"
        "networkmanager"
      ];
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

  networking = {
    hostName = "nixos";
    wireless.networks.SpiBrou = {
      psk = "nomoresunflowers!!!";
    };
  };

  time.timeZone = "America/Los_Angeles";

  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ amdvlk ];
    };
  };

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
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      jspidell = import ../home/home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
