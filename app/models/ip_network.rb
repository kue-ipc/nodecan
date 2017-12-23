# frozen_string_literal: true

class IpNetwork < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip_pools, dependent: :destroy

  def ipv4?
    address.ipv4?
  end

  def ipv6?
    address.ipv6?
  end
end
