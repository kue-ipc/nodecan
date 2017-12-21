# frozen_string_literal: true

require 'ipaddress'

class Ipv4Network < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip4_pools, dependent: :destroy
  attribute :address, :ipv4_address, default: IPAddress::IPv4.new('0.0.0.0')
  attribute :gateway, :ipv4_address
end
