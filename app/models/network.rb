class Network < ApplicationRecord
  has_many :network_users, dependent: :destroy
  has_many :users, through: :network_users
  has_many :ip_networks, dependent: :destroy
  accepts_nested_attributes_for :ip_networks, allow_destroy: true

  def ipv4_networks
    ip_networks.select(&:ipv4?)
  end

  def ipv6_networks
    ip_networks.select(&:ipv6?)
  end

  def use_ipv4
    !ipv4_networks.empty?
  end

  def use_ipv6
    !ipv6_networks.empty?
  end
end
