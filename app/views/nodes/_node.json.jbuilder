json.extract! node, :id, :name, :user_id, :confirmed, :note, :created_at, :updated_at
json.url node_url(node, format: :json)
