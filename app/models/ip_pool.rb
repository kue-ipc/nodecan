class IpPool < ApplicationRecord
  include NetworkType
  belongs_to :ip_network

  def ipv4?
    ip_network.ipv4?
  end

  def ipv6?
    ip_network.ipv6?
  end
end
