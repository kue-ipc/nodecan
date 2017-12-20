class Ipv6Pool < ApplicationRecord
  include NetworkType
  belongs_to :ipv6_network
  attribute :first, :ipv6_address, default: 0
  attribute :last, :ipv6_address, default: 0
end
