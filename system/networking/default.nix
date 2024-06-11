{ ... }:

{
  imports =
  [
    ./dns.nix
    ./vpn.nix
  ];

  networking = {
    # use iNet Wireless Daemon (instead of wpa_supplicant) for wireless device management
    wireless.iwd = {
      enable = true;

      # All options: https://iwd.wiki.kernel.org/networkconfigurationsettings
      settings = {
        Network = {
          EnableIPv6 = true;
          RoutePriorityOffset = 300;
        };
        Settings = {
          AutoConnect = true;
          Hidden = true;
          AlwaysRandomizeAddress = false; # for predictable local network
        };
      };
    };

    networkmanager = {
      enable = false;
    };

  };
}
