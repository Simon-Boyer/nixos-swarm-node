{ config, ... }:

# TO EDIT FOR EACH NODE (remove -edit)

{
    fileSystems."/data/glusterfs/configs/brick1" =
    { 
      device = "/dev/sda4";
      fsType = "xfs";
    };

    fileSystems."/data/glusterfs/shared/brick1" =
    { 
      device = "/dev/sdb1";
      fsType = "xfs";
    };
}