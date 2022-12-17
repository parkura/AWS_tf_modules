
variable "db_name" {
  type = string
  default = "dev-db-mysql-5-7"
}


variable "subnet_id" {
  type = list(any)
}
