# NixOS Docker Swarm Node Configuration

Personnal NixOS configuration for a docker swarm node 

### Configures:

- Users
- GlusterFS
- Docker
- Auto-upgrades

### Steps:

1. Create a CA certificate/key pair for your GlusterFS cluster, place the certificate as `./certs/glusterfs.ca` in each node.
2. Use the CA to create certficates for each node, and add them as `./certs/glusterfs.pem` and `./certs/glusterfs.key` in the corresponding nodes.
3. Edit the `*-toedit` files with your values, then rename them without the `-toedit`
4. Apply the nix configuration
5. Setup the GlusterFS pools and volumes (see https://docs.gluster.org/en/latest/)
6. Setup Docker Swarm