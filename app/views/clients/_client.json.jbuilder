json.extract! client, :id, :name, :lastName, :phone, :email, :locality_id, :created_at, :updated_at
json.url client_url(client, format: :json)
