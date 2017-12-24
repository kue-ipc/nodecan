# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :database_authenticatable
  # :rememberable, :lockable
  # devise :database_authenticatable, :ldap_authenticatable,
  # devise :database_authenticatable,
  devise :ldap_authenticatable,
         :trackable, :validatable, :timeoutable
  has_many :network_users, dependent: :destroy
  has_many :networks, through: :network_users

  before_validation :set_email_from_ldap, :set_display_name_from_ldap

  def set_email_from_ldap
    mails = Devise::LDAP::Adapter.get_ldap_param(username, 'mail')
    self.email = mails[0] if mails && !mails.empty?
  end

  def set_display_name_from_ldap
    names = Devise::LDAP::Adapter.get_ldap_param(username, 'cn')
    self.display_name = names[0] if names && !names.empty?
  end

  def admin?
    admin
  end

  def default_network
    network_users.find_by(default: true).network
  end

  def assignable_networks
    network_users.where(assignable: true).map(&:network)
  end
end
