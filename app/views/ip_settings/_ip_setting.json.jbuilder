json.extract! ip_setting, :id, :name, :require_address, :require_dhcp, :register_reservation, :created_at, :updated_at
json.url ip_setting_url(ip_setting, format: :json)
