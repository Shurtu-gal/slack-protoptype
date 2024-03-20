locals {
  ambassadors_data = jsondecode(file("${path.module}/../../../AMBASSADORS.json")) 
  ambassadors_emails = {
    for ambassador in local.ambassadors_data : ambassador.email => {
      email = ambassador.email
    }
  }

  maintainers_data = yamldecode(file("${path.module}/../../../MAINTAINERS.yaml"))
  maintainers_user_ids = [for maintainer in local.maintainers_data : maintainer.slack]
}

data "slack_user" "ambassadors" {
  for_each = local.ambassadors_emails
  email = each.value.email
}

output "emails" {
  value = data.slack_user.ambassadors
}

output "user_ids" {
  value = local.maintainers_user_ids
}