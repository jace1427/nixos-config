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

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "America/Los_Angeles";
  networking.hostName = "nixos";

  hardware = {
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
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
