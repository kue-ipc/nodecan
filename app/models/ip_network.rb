class IpNetwork < ApplicationRecord
  TYPES = { static: 0, dhcp: 1, auto: 2 }.freeze
end
