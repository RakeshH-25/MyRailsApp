json.array!(@admins) do |admin|
  json.extract! admin, :id, :email, :password_hash, :passowrd_salt
  json.url admin_url(admin, format: :json)
end
