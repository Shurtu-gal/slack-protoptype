# resource "slack_usergroup" "ambassadors" {
#   name = "ambassadors"
#   handle = "ambassadors"
#   description = "Ambassadors"
#   users = [for ambassador in local.ambassadors_data : data.slack_user.ambassadors[ambassador.email].id]  
# }

# resource "slack_usergroup" "maintainers" {
#   name = "maintainers"
#   handle = "tsc_members"
#   description = "Maintainers"
#   users = local.maintainers_user_ids
# }