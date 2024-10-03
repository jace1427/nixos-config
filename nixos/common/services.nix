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

    getty.autologinUser = "jspidell";

    displayManager.defaultSession = "hyprland";

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
