class Network < ApplicationRecord
  belongs_to :ipv4_network
  belongs_to :ipv6_network
end
