# services.nix
{ config, pkgs, ... }:
{
  services = {
    openssh.enable = true;
    printing.enable = true;

    flatpak = {
      enable = true;
      packages = [ "com.usebottles.bottles" ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };

    input-remapper.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
      };
      defaultSession = "hyprland";
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "modesetting" ];
    };

    libinput = {
      enable = true;
      mouse.accelSpeed = null;
      mouse.accelProfile = "flat";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      # wireplumber.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    minecraft-server = {
      enable = true;
      eula = true;
    };
  };
}
