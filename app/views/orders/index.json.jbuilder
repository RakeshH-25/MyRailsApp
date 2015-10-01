json.array!(@orders) do |order|
  json.extract! order, :id, :name, :email, :contact_no, :pay_type, :address, :user_id
  json.url order_url(order, format: :json)
end
