class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :database_authenticatable
  # :rememberable, :lockable
  # devise :database_authenticatable, :ldap_authenticatable,
  # devise :database_authenticatable,
  devise :ldap_authenticatable,
         :trackable, :validatable, :timeoutable

end
