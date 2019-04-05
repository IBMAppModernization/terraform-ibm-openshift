

######### Install OCP and its prerequisits

#rm -fr /var/cache/yum/*

#yum clean all

yum install -y wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

yum install -y vim

yum install -y tmux

yum update -y

yum -y --enablerepo=epel install ansible

# Clone the openshift/openshift-ansible repository from GitHub, which provides the required playbooks and configuration files:
git clone https://github.com/openshift/openshift-ansible ~/openshift-ansible
cd  ~/openshift-ansible
git checkout release-3.10
cd -


###### Define the bastian as Gateway for all other nodes (disabled by Red Hat):

#sysctl net.ipv4.ip_forward=1
