json.extract! question, :id, :title, :text, :lang_from, :lang_to, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
