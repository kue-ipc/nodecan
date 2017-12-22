class IpPool < ApplicationRecord
  include NetworkType
  belongs_to :ip_network
end
