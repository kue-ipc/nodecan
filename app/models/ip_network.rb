# frozen_string_literal: true

class IpNetwork < ApplicationRecord
  include NetworkType
  belongs_to :network
  has_many :ip_pools, dependent: :destroy
end
