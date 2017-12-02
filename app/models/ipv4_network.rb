class Ipv4Network < IpNetwork
  include NetworkType
  belongs_to :network
  has_many :ip4_pools
end
