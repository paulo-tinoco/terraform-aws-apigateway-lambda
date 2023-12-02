variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "default_tags" {
  description = "A map of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "lambda" {
  type = object({
    name        = string
    description = optional(string)
    memory_size = optional(number)
    timeout     = optional(number)
    runtime     = string
    handler     = string
    filename    = string
    environment = optional(map(string))

    policies = optional(list(object({
      name      = string
      actions   = list(string)
      resources = list(string)
    })), [])
  })

  description = "Configuration for Lambda"
}

variable "apigateway" {
  type = object({
    name        = optional(string, "")
    description = optional(string)
    stage_name  = string

    policies = optional(list(object({
      name      = string
      actions   = list(string)
      resources = list(string)
    })), [])
  })

  description = "Configuration for API Gateway"
}