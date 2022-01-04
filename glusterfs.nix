{ config, ... }:

{

    environment.etc = {
        "/etc/ssl/glusterfs.key" = {
            mode = "0555";
            source = ./certs/glusterfs.key;
        };
    };  

    services.glusterfs = {
        enable = true;
        tlsSettings = {
            tlsPem = ./certs/glusterfs.pem;
            tlsKeyPath = "/etc/ssl/glusterfs.key";
            caCert = ./certs/glusterfs.ca;
        };
    };
}   