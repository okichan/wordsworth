json.extract! conversation, :id, :user1_id, :user2_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
