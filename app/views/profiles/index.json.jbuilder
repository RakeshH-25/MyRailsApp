json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :contact_no, :address, :user_id
  json.url profile_url(profile, format: :json)
end
