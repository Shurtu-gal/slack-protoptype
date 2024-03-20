resource "slack_conversation" "maintainers" {
  name = "maintainers"
  topic = "Maintainers"
  purpose = "This channel is for maintainers"
  permanent_members = local.maintainers_user_ids

  is_private = true # should be false for public channels
  action_on_destroy = "archive" # should be none for public channels
  action_on_update_permanent_members = "kick" # should be none for public channels
  adopt_existing_channel = true
}

resource "slack_conversation" "ambassadors" {
  name = "ambassadors"
  topic = "Ambassadors"
  purpose = "This channel is for ambassadors"
  # permanent_members = slack_usergroup.ambassadors.users
  permanent_members = [for ambassador in local.ambassadors_data : data.slack_user.ambassadors[ambassador.email].id]

  is_private = true # should be false for public channels  
}