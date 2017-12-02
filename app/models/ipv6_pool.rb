class Ipv6Pool < ApplicationRecord
  include NetworkType
  belongs_to :ipv6_network
end
