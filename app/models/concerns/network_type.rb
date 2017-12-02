# frozen_string_literal: true

require 'active_support/concern'

module NetworkType
  extend ActiveSupport::Concern
  included do
    enum type: { static: 0, dhcp: 1, auto: 2 }
  end
end
