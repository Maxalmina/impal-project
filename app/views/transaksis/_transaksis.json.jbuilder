userjson.extract! transaksi, :id, :produsen_id, :user_id, :created_at, :updated_at
json.url transaksi_url(transaksi, format: :json)