# frozen_string_literal: true

require 'ipaddress'

class Ipv4AddressType < ActiveRecord::Type::Binary
  def deserialize(value)
    IPAddress::IPv4.parse_data(value) unless value.nil?
  end

  def cast(value)
    case value
    when Integer
      IPAddress::IPv4.parse_u32(value)
    when String
      IPAddress::IPv4.new(value)
    end
  end

  def serialize(value)
    value.data
  end
end

class Ipv6AddressType < ActiveRecord::Type::Binary
  def deserialize(value)
    IPAddress::IPv6.parse_data(value)
  end

  def cast(value)
    case value
    when Integer
      IPAddress::IPv6.parse_u128(value)
    when String
      IPAddress::IPv6.new(value)
    end
  end

  def serialize(value)
    value.data
  end
end

ActiveRecord::Type.register(:ipv4_address, Ipv4AddressType)
ActiveRecord::Type.register(:ipv6_address, Ipv6AddressType)
