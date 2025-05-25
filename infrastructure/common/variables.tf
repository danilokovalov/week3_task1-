variable "ami_id" {
  description = "AMI ID для EC2"
  default = "ami-02b7d5b1e55a7b5f1"
}

variable "instance_type" {
  description = "Тип EC2 інстансу"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Назва SSH ключа"
  default = "frank-linux-server"
}

variable "subnet_ids" {
  description = "Список ID підмереж (public)"
  default = [
    "subnet-0577df925f08f7b7c",
    "subnet-0df9998bf329f4018",
    "subnet-09bf629d41cea1cc6"
  ]
}

variable "alb_sg" {
  description = "Security Group ID for ALB"
  default = "sg-052552720f8ebf620"
}

variable "vpc_id" {

  default = "vpc-0d909c1fefda41be6"
}

variable "mail_my" {

  default = "danilokovalov09@gmail.com"
}