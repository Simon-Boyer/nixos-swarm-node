{ config, ... }:
let usernames = ["simon-boyer"]; #Github username

{
    users.users = map (name : {
        "${name}" = {
            isNormalUser = true;
            extraGroups = ["wheel" "docker"];
            openssh.authorizedKeys.keyFiles = [
                "https://github.com/${name}.keys"
            ];
        };
    }) usernames;
}