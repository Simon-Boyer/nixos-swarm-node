{ config, ... }:

# TO EDIT FOR EACH NODE (remove -toedit)
let updateDay = "Sun";
    hostname = "test-node-1";
    customNameServers = ["192.168.2.1"];
    interfaces = {
        eth0 = {
            ipv4 = {
                addresses = [
                    {
                    address = "192.168.2.10";
                    prefixLength = 24;
                    }
                ];
            };
        };
    };

# Actual configuration, no need to edit
{
    system.autoUpgrade.dates = "${updateDay} *-*-* 00:00:00";

    networking = {
    connman.enable = true;
    hostName = hostname;
    nameservers = customNameServers ++ [
      "1.1.1.1"
      "1.0.0.1"
    ];
    interfaces = interfaces;
  };
}