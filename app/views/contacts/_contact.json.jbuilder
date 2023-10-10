json.extract! contact, :id, :name, :lastName, :phone, :email, :content, :locality_id, :publication_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
