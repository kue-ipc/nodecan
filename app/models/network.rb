class Network < ApplicationRecord
  has_many :users, through: :user_networks
  has_many :user_networks
  has_many :ip_networks
  accepts_nested_attributes_for :ip_networks

  def use_ipv4
    !ipv4_network.nil?
  end

  def use_ipv6
    !ipv6_network.nil?
  end

end
