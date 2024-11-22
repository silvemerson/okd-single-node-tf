variable "project_id" {
  description = "ID do projeto no Google Cloud"
  type        = string
}

variable "region" {
  description = "Região do Google Cloud"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zona do Google Cloud"
  type        = string
  default     = "us-central1-a"
}

variable "security" {
    default = "sg-olimpo"
  
}