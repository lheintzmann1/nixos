{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];
  
  # Host-specific configuration goes here
  # Kernel optimizations
  # boot.kernel.sysctl = {
  #   "vm.swappiness" = 10;
  #   "vm.dirty_ratio" = 15;
  #   "vm.dirty_background_ratio" = 5;
  #   "net.core.rmem_max" = 134217728;
  #   "net.core.wmem_max" = 134217728;
  # };

  services.xserver.enable = true;

  # Enhance SSD performances
  services.fstrim.enable = true;

  hardware.graphics = {
    enable = true;
  };
}
