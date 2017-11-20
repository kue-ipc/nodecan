class Ipv6Network < IpNetwork
  belongs_to :network
  enum type: TYPES
end
