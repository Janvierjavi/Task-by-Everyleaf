json.extract! user, :id, :name, :emails, :created_at, :updated_at
json.url user_url(user, format: :json)
