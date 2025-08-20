{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];
  
  # Host-specific configuration goes here
  # Kernel optimizations
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_ratio" = 15;
    "vm.dirty_background_ratio" = 5;
    "net.core.rmem_max" = 134217728;
    "net.core.wmem_max" = 134217728;
  };

  # Enhance SSD performances
  services.fstrim.enable = true;

  # NVidia
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    forceFullCompositionPipeline = true;
  };

  hardware.graphics = {
    enable = true;
  };
}