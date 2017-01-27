  json.body @message.body
  json.date @message.created_at.to_s(:default)
  json.name @message.user.name