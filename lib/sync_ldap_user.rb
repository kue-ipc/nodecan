# frozen_string_literal: true

require 'devise_ldap_authenticatable'

class SyncLdapUser
  def initialize
    adminConnection = ::Devise.LDAP::Connection.new(admin: true)
  end
end
