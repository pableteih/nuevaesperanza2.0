json.extract! product, :id, :quantity, :type_id, :composition_id, :locality_id, :client_id, :created_at, :updated_at
json.url product_url(product, format: :json)
