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
      declarative = true;
      whitelist = {
        jace142 = "9c3c024d-1577-4280-9a04-b99e460b77d1";
        BlazingHack_ = "5dac4040-89e7-4d8e-9e3a-bb4d01c1a82d";
        petitesalope = "0c1cacea-37d4-4790-aa99-759c02f5a7f6";
      };
      openFirewall = true;
      serverProperties = {
        server-port = 43000;
        difficutly = 2;
        gamemode = 0;
        max-players = 20;
        motd = ":)";
        white-list = true;
      };
      dataDir = "/home/jspidell/minecraft/";
    };
  };
}
