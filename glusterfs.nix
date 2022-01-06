{ config, ... }:

{

    environment.etc = {
        "ssl/private/glusterfs.key" = {
            mode = "0555";
            source = ./certs/glusterfs.key;
        };
    };

    services.glusterfs = {
        enable = true;
        tlsSettings = {
            tlsPem = ./certs/glusterfs.pem;
            tlsKeyPath = "/etc/ssl/private/glusterfs.key";
            caCert = ./certs/glusterfs.ca;
        };
    };
}