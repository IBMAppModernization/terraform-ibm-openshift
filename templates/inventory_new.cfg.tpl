# OpenShift Inventory Template.
# Note that when the infrastructure is generated by Terraform, this file is
# expanded into './inventory.cfg', based on the rules in:


# Set variables common for all OSEv3 hosts
[OSEv3:vars]

ansible_ssh_user=root
ansible_ssh_extra_args='-o StrictHostKeyChecking=no'

# Deploy OpenShift Origin 3.10
openshift_deployment_type=origin
openshift_release= "3.10"
openshift_enable_docker_excluder=false

# We need a wildcard DNS setup for our public access to services, fortunately
# we can use the superb xip.io to get one for free.
openshift_public_hostname=${master_hostname}
openshift_master_default_subdomain=${subdomain}

# Use an htpasswd file as the indentity provider.
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]
openshift_disable_check= docker_image_availability,docker_storage,memory_availability,package_availability,package_version
# Uncomment the line below to enable metrics for the cluster.
# openshift_hosted_metrics_deploy=true

# https://access.redhat.com/solutions/3617551
openshift_storage_glusterfs_image="registry.access.redhat.com/rhgs3/rhgs-server-rhel7:v3.10"
openshift_storage_glusterfs_block_image="registry.access.redhat.com/rhgs3/rhgs-gluster-block-prov-rhel7:v3.10"
openshift_storage_glusterfs_heketi_image="registry.access.redhat.com/rhgs3/rhgs-volmanager-rhel7:v3.10"

#openshift_storage_glusterfs_image="gluster/gluster-centos"
#openshift_storage_glusterfs_block_image="gluster/glusterblock-provisioner"
#openshift_storage_glusterfs_heketi_image="heketi/heketi"


[masters]
${master_block}

# host group for etcd
[etcd]
${master_block}

[nodes:children]
masters
compute_nodes
infra_nodes
glusterfs

[compute_nodes]
${compute_block}

[infra_nodes]
${infra_block}

[glusterfs]
${gluster_block}

[virtual_nodes:children]
compute_nodes
glusterfs
masters
etcd
infra_nodes


[seed-hosts:children]
masters

[OSEv3:children]
masters
nodes
etcd
glusterfs

[tower-management-host]
${tower_block}
