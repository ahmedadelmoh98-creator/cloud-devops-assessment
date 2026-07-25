variable "aws_region" {
  description = "AWS region used to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used as a prefix for AWS resources"
  type        = string
  default     = "cloud-devops-assessment"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "database_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "appdb"
}

variable "database_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "appadmin"
}

variable "database_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}
