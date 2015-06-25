json.array!(@gifts) do |gift|
  json.extract! gift, :id, :title, :description, :price, :gift_url, :due_date, :recipient, :user_id, :hashed_id
  json.url gift_url(gift, format: :json)
end
