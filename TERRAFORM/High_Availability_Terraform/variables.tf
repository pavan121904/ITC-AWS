variable "tags" {
  type = map
  default = {
    Name = "High_Availability"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "igw_tags" {
  type = map
  default = {
    Name = "High_Availability_igw"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "public_subnet_tags" {
  type = map
  default = {
    Name = "High_Availability_public_subnet"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "private_subnet_tags" {
  type = map
  default = {
    Name = "High_Availability_private_subnet"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "public_route_table_tags" {
  type = map
  default = {
    Name = "High_Availability_public_rt"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "nat_tags" {
  type = map
  default = {
    Name = "High_Availability_natgateway"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "private_route_table_tags" {
  type = map
  default = {
    Name = "High_Availability_private_rout_table"
    Environment = "Dev"
    Terraform = "true"
  }
}

variable "database_subnet_tags" {
  type = map
  default = {
    Name = "High_Availability_database_subnet"
    Environment = "Dev"
  }
}
