# services.nix
{ config, pkgs, ... }:
{
  services = {
    openssh.enable = true;
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    flatpak = {
      enable = true;
      packages = [ "com.usebottles.bottles" ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        theme = "background=/home/jspidell/dir/nixos-config/wallpapers/solarized/a_red_sun_over_mountains.jpg";
      };
      defaultSession = "hyprland";
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "modesetting" ];
    };

    xremap = {
      withWlroots = true;
      userName = "jspidell";
      mouse = true;

      config = {
        modmap = [
          {
            name = "Global Modmap";
            remap = {
              "BTN_SIDE" = "LeftShift";
              "BTN_EXTRA" = "LeftCtrl";
            };
          }
        ];
      };
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
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
