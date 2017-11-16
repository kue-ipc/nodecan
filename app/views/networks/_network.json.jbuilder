json.extract! network, :id, :name, :display_name, :vlan, :ipv4_network_id, :ipv6_network_id, :use_auth, :note, :created_at, :updated_at
json.url network_url(network, format: :json)
