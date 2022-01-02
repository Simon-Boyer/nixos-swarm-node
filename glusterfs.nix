{ config, ... }:

{
    services.glusterfs = {
        enable = true;
        tlsSettings = {
            tlsPem = "/etc/ssl/glusterfs.pem";
            tlsKeyPath = "/etc/ssl/glusterfs.key";
            caCert = "/etc/ssl/glusterfs.ca";
        };
    };

    environment.etc = {
        "/etc/ssl/glusterfs.pem" = {
            mode = "0555";
            source = "./certs/glusterfs.pem";
        };
        "/etc/ssl/glusterfs.key" = {
            mode = "0555";
            source = "./certs/glusterfs.key";
        };
        "/etc/ssl/glusterfs.ca" = {
            mode = "0555";
            source = "./certs/glusterfs.ca";
        };
    };  
}   