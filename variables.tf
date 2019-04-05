
variable "hourly_billing" {
  default = "true"
}

variable "datacenter" {
  default = "wdc07"
}

variable "hostname_prefix"{
  default = "IBM-CDA-OCP"
}

variable "bastion_count" {
  default = 1
}

variable "master_count" {
  default = 1
}

variable "infra_count" {
  default = 1
}

variable "app_count" {
  default = 1
}

variable "storage_count" {
  default = 3
}

variable "ssh_public_key" {
  default     = "/mnt/id_rsa.pub"
}

variable "ssh-label" {
  default = "ssh_key_terraform"
}

variable "vm_domain" {
  default = "IBM-OpenShift.cloud"
}


variable "ibm_sl_username"{
}


variable "ibm_sl_api_key"{
}


variable "private_ssh_key"{
  default     = "/mnt/id_rsa"
}

variable vlan_count {
  description = "Set to 0 if using existing and 1 if deploying a new VLAN"
  default = "0"
}
variable private_vlanid {
  description = "ID of existing private VLAN to connect VSIs"
  default = "2588891"
}

variable public_vlanid {
  description = "ID of existing public VLAN to connect VSIs"
  default = "2588833"
}

### Flavors to be changed to actual values in '#...'

variable bastion_flavor {
  default = "B1_4X16X100"
}

variable master_flavor {
   default = "B1_4X16X100"
}

variable infra_flavor {
   default = "B1_4X16X100"
}

variable app_flavor {
   default = "B1_4X16X100"
}
