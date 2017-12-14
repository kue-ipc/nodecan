# frozen_string_literal: true

require 'ipaddress'

class Ipv4Network < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip4_pools, dependent: :destroy

  def address_ip
    ip = IPAddress::IPv4.parse_u32(address || 0)
    ip.prefix = netmask if netmask
    ip
  end

  def gateway_ip
    IPAddress::IPv4.parse_u32(gateway || 0)
  end

  def address_text
    address_ip.to_s
  end

  def gateway_text
    gateway_ip.to_s
  end
end
