class Nic < ApplicationRecord
  IP_SETTINGS = { disabled: 0, auto: 1, reserved: 2, static: 3 }.freeze
  belongs_to :node
  belongs_to :network

  enum network_type: { wired: 0, wireless: 1, virtual: 2 }
  enum ipv4_setting: IP_SETTINGS, _prefix: :ipv4
  enum ipv6_setting: IP_SETTINGS, _prefix: :ipv6
end
