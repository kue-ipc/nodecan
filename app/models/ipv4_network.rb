# frozen_string_literal: true

require 'ipaddress'

class Ipv4Network < IpNetwork
  include NetworkType
  belongs_to :network
  has_many :ip4_pools, dependent: :destroy

  def ip
    IPAddress::IPv4.parse_32(address)
  end
end
