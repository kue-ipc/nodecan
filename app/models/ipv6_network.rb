# frozen_string_literal: true

require 'ipaddress'

class Ipv6Network < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip6_pools, dependent: :destroy
  attribute :address, :ipv6_address, default: 0
  attribute :gateway, :ipv6_address, default: 0
end
