{
    updateDay = "Sun";
    hostname = "test-node-1";
    customNameServers = ["192.168.2.1"];
    networkInterface = "ensp1s0";
    ipAddress = "192.168.122.75";
    ipPrefixLength = 24;
    gateway = "192.168.122.1";
    usernames = ["simon-boyer"]; #Github username
    cephVolumes = {
        configs = [ "/dev/vda2" ];
    };
}   