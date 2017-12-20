class Ipv4Pool < ApplicationRecord
  include NetworkType
  belongs_to :ipv4_network
  attribute :first, :ipv4_address
  attribute :last, :ipv4_address
end
