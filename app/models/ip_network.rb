# frozen_string_literal: true

require 'ipaddr_mask_addr'

class IpNetwork < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip_pools, dependent: :destroy
  accepts_nested_attributes_for :ip_pools, allow_destroy: true

  def netmask
    address&.mask_cidr
  end

  def ipv4?
    address.ipv4?
  end

  def ipv6?
    address.ipv6?
  end
end
