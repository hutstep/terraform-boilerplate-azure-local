variable "stage" {
  description = "The stage of the environment"
  type        = string
  nullable    = false
}

variable "subscription_id" {
  description = "The subscription id"
  type        = string
  nullable    = false
}

variable "project" {
  description = "The project name"
  type        = string
  nullable    = false
}

variable "location" {
  description = "The location of the resources"
  type        = string
  nullable    = false
}
