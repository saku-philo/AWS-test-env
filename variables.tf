# ===============================================
# Variables
# ===============================================
# System name
variable "sysname" {
  type        = string
  default     = "test-app"
  description = "application name"
}

# Network
variable "cidr_block" {
  type        = string
  default     = "192.168.0.0/16"
  description = "ipv4 cidr block"
}
