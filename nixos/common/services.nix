# services.nix
{
  config,
  pkgs,
  ...
}: {
  services = {
    openssh.enable = true;
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
