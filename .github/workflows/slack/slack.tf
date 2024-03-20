terraform {
  required_providers {
    slack = {
      source  = "pablovarela/slack"
      version = "~> 1.0"
    }
  }
  required_version = ">= 0.13"
}

variable "slack_token" {
  description = "The Slack API token with the channels:manage, channels:read, channels:write.invites, groups:read, groups:write, groups:write.invites, users:read scopes"
  nullable = false
  type = string 
}

provider "slack" {
  token = var.slack_token
}