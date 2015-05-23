json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :email
  json.url user_url(user, format: :json)
end
