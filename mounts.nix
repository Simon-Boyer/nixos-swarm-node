{ config, ... }:

with (import ./node-config.nix);
with builtins;
{

    fileSystems =  listToAttrs(
      concatLists (
        attrValues (
          mapAttrs (volume : devices: 
                  map (dev:
                    let path = split "\/" dev;
                    in 
                    {
                      name = "/data/glusterfs/${volume}/brick_${elemAt path (length path - 1)}";
                      value = {
                        device = dev;
                        fsType = "xfs";
                        }; 
                      }) devices
                    ) cephVolumes
            )
          )
        );
}