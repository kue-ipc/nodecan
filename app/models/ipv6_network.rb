class Ipv6Network < ApplicationRecord
  belongs_to :network
  belongs_to :dhcp_type
end
