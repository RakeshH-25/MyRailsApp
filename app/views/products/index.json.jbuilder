json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image, :price, :active, :department_id
  json.url product_url(product, format: :json)
end
