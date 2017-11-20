class Nic < ApplicationRecord
  belongs_to :node
  belongs_to :nic_type
  belongs_to :network
  belongs_to :ipv4_setting, class_name: 'IpSetting'
  belongs_to :ipv6_setting
end
