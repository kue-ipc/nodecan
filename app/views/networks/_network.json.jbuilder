json.extract! network, :id, :name, :vlan, :use_ipv4, :use_ipv6, :use_auth, :note, :created_at, :updated_at
json.url network_url(network, format: :json)
