variable "server_name" {
  type = string
  default  = "Server1"
}

variable "server_size" {
  type = string
  default = "t2.micro"
}

variable "sg_ports" {
    type = set(string)
    default = ["80", "443", "22"]
}