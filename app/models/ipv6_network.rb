class Ipv6Network < IpNetwork
  include NetworkType
  belongs_to :network
  has_many :ip6_pools
end
