{ config, ... }:

with (import ./node-config.nix);
# Actual configuration, no need to edit
{
    system.autoUpgrade.dates = "${updateDay} *-*-* 00:00:00";

    networking = {
        hostName = hostname;
        nameservers = customNameServers ++ [
        "1.1.1.1"
        "1.0.0.1"
        ];
        interfaces = {
            "${networkInterface}" = {
                ipv4 = {
                    addresses = [
                        {
                        address = ipAddress;
                        prefixLength = ipPrefixLength;
                        }
                    ];
                };
            };
        };
        defaultGateway = {
            address = gateway;
            interface = networkInterface;
        };
        firewall.enable = false;
  };
}