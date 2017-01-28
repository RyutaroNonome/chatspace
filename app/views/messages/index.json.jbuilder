json.array!(@group.messages.includes(:user)) do |message|
  json.body  message.body
  json.date  message.created_at.to_s(:default)
  json.name  message.user.name
  json.image message.image.url
end