json.extract! product, :id, :nome, :price, :status, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
