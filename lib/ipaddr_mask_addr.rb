# frozen_string_literal: true

# WARNING: hack ipaddr library

require 'ipaddr'

class IPAddr
  attr_reader :mask_addr

  def mask_string
    _to_string(mask_addr)
  end

  def mask_cidr
    mask_addr.to_s(2).count('1')
  end
end
