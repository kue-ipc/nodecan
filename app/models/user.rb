# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :database_authenticatable
  # :rememberable, :lockable
  # devise :database_authenticatable, :ldap_authenticatable,
  # devise :database_authenticatable,
  devise :ldap_authenticatable, :trackable, :validatable, :timeoutable

  enum role: [:user, :admin]

  validates :username, presence: true, uniqueness: {case_sensitive: true}, length: {maximum: 255}
  validates :email, presence: true
  validates :fullname, allow_blank: true, length: {maximum: 255}

  has_many :network_users, dependent: :destroy
  has_many :default_networck_users, -> { where(default: true) }, class_name: 'NetworkUser'
  has_many :assignable_networck_users, -> { where(assignable: true) }, class_name: 'NetworkUser'

  has_many :networks, through: :network_users
  has_many :default_networks, through: :default_networck_users, source: :network
  has_many :assignable_networks, through: :assignable_networck_users, source: :network

  def ldap_before_save
    sync_ldap!
    # The first user is admin
    admin! if User.count.zero?
    p self
  end

  def ldap_entry
    return if deleted?

    @ldap_entry ||= Devise::LDAP::Adapter.get_ldap_entry(username)
  end

  def ldap_find_attr(*list)
    list.each do |name|
      value = ldap_entry&.[](name)&.first
      return value if value
    end
    nil
  end

  def ldap_mail
    ldap_find_attr('mail')
  end

  def ldap_display_name
    ldap_find_attr("displayName;lang-#{I18n.default_locale}", 'displayName',
                   "cn;lang-#{I18n.default_locale}", 'cn')
  end

  def sync_ldap!
    return unless ldap_entry

    self.email = ldap_mail
    self.fullname = ldap_display_name
  end

  def name
    if fullname.present?
      "#{fullname} (#{username})"
    else
      username
    end
  end

  def deleted?
    deleted
  end

  def to_s
    name
  end

  def default_network
    default_networks.first
  end
end
