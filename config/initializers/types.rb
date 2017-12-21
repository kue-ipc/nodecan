# frozen_string_literal: true

require 'ip_address_types'

ActiveRecord::Type.register(:ipv4_address, Ipv4AddressType)
ActiveRecord::Type.register(:ipv6_address, Ipv6AddressType)
