json.extract! user, :id, :name, :image, :mail, :job, :birthday, :created_at, :updated_at
json.url user_url(user, format: :json)
