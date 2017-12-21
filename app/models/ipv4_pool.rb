class Ipv4Pool < ApplicationRecord
  include NetworkType
  belongs_to :ipv4_network
  attribute :first, :ipv4_address, default: IPAddress::IPv4.new('0.0.0.0')
  attribute :last, :ipv4_address, default: IPAddress::IPv4.new('0.0.0.0')
end
