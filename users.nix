{ config, ... }:

with (import ./node-config.nix);
{
    users.users = builtins.listToAttrs ( 
        map (name : {
            name = "${name}";
            value = {
                isNormalUser = true;
                extraGroups = ["wheel" "docker"];
                openssh.authorizedKeys.keyFiles = [ 
                    (builtins.fetchurl "https://github.com/${name}.keys") 
                ];
            };
        }) usernames
    );
}