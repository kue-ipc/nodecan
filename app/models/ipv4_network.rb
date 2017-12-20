# frozen_string_literal: true

require 'ipaddress'

class Ipv4Network < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip4_pools, dependent: :destroy
  attribute :address, :ipv4_address
  attribute :gateway, :ipv4_address
end
