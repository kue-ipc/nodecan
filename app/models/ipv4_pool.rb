class Ipv4Pool < ApplicationRecord
  include NetworkType
  belongs_to :ipv4_network
end
