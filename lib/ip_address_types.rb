# frozen_string_literal: true

require 'ipaddress'

class Ipv4AddressType < ActiveRecord::Type::Binary
  def deserialize(value)
    return if value.nil?
    if Rails.configuration.database_configuration[Rails.env]['adapter'] == "postgresql"
      value = PG::Connection.unescape_bytea(value)
    end
    IPAddress::IPv4.parse_data(value)
  end

  def cast(value)
    case value
    when Data
      IPAddress::IPv4.parse_data(value.to_s)
    when Integer
      IPAddress::IPv4.parse_u32(value)
    when String
      IPAddress::IPv4.new(value)
    end
  end

  def serialize(value)
    super(value&.data)
  end
end

class Ipv6AddressType < ActiveRecord::Type::Binary
  def deserialize(value)
    return if value.nil?
    if Rails.configuration.database_configuration[Rails.env]['adapter'] == "postgresql"
      value = PG::Connection.unescape_bytea(value)
    end
    p value
    IPAddress::IPv6.parse_data(value)
  end

  def cast(value)
    case value
    when Data
      IPAddress::IPv6.parse_data(value.to_s)
    when Integer
      IPAddress::IPv6.parse_u128(value)
    when String
      IPAddress::IPv6.new(value)
    end
  end

  def serialize(value)
    super(value&.data)
  end
end
