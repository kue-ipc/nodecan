json.extract! os_product, :id, :name, :os_family_id, :require_security_software, :created_at, :updated_at
json.url os_product_url(os_product, format: :json)
