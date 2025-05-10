{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.lucas = {
    isNormalUser = true;
    description = "Lucas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
