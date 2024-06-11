# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    # You can also split up your configuration and import pieces of it here:
    ./jspidell.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  services.xserver.enable = true;
  services.xserver.videoDrivers = ["modesetting"];
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.libinput.enable = true;
  services.libinput.mouse.accelSpeed = null;
  services.libinput.mouse.accelProfile = "flat";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  time.timeZone = "America/Los_Angeles";

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gh
    wowup-cf
    discord
    spotify
    vscode
    obsidian
    alejandra
  ];

  services.openssh.enable = true;

  services.flatpak.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.config.common.default = "gtk";

  users.defaultUserShell = pkgs.fish;

  users.users.jspidell = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "networkmanager"];
    packages = with pkgs; [
      (wineWowPackages.full.override {
        wineRelease = "staging";
        mingwSupport = true;
      })
      winetricks
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      # Import your home-manager configuration
      jspidell = import ../home-manager/home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
