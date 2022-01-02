{ config, pkgs, ... }:

let githubUsername = "Simon-Boyer";

{

  imports = [
    # Add hardware scan configuration.
    ./hardware-configuration.nix
    # Add environment settings.
    ./environment.nix
    # Add packages.
    ./packages.nix
    # Add glusetrfs
    ./glusterfs.nix
    # Add mounts
    ./mounts.nix
    # Add users
    ./users.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true; 
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  services = {
    journald = {
      extraConfig = ''
        SystemMaxUse=50M
      '';
    };
    openssh = {
        enable = true;
        services.openssh.passwordAuthentication = false;
    };
  };

  system = {
    autoUpgrade = {
      channel= "https://nixos.org/channels/nixos-21.11";
      enable = true;
      system.autoUpgrade.allowReboot = true;
    };
    stateVersion = "21.11";
  };

  time.timeZone = "America/Toronto";

  virtualisation.docker = {
    enable = true;
    socketActivation = true;
    liveRestore = false;
  };
}