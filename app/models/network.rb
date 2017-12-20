class Network < ApplicationRecord
  has_many :users, through: :user_networks
  has_many :user_networks
  has_one :ipv4_network, dependent: :destroy
  has_one :ipv6_network, dependent: :destroy
  accepts_nested_attributes_for :ipv4_network
  accepts_nested_attributes_for :ipv6_network

  def use_ipv4
    !ipv4_network.nil?
  end

  def use_ipv6
    !ipv6_network.nil?
  end

end
