json.extract! room, :id, :name, :introduce, :single_rate, :address, :image_name, :user_id, :created_at, :updated_at
json.url room_url(room, format: :json)
