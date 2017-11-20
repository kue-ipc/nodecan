class Ipv4Network < IpNetwork
  belongs_to :network
  enum type: TYPES
end
