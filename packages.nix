{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        glusterfs
        neovim
        wget
        curl
        docker-compose
    ];
}