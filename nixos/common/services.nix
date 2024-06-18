# services.nix
{
  config,
  pkgs,
  ...
}: {
  services = {
    openssh.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true;

    flatpak = {
      enable = true;
      packages = [
        "com.usebottles.bottles"
      ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };

    input-remapper.enable = true;

    xserver = {
      enable = true;
      videoDrivers = ["modesetting"];
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
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
