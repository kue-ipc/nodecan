class Network < ApplicationRecord
  has_many :users, through: :user_networks
  has_many :user_networks
  has_one :ipv4_network, dependent: :destroy
  has_one :ipv6_network, dependent: :destroy
end
