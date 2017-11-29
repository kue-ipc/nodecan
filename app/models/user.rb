class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :database_authenticatable
  # :rememberable,
  devise :database_authenticatable, :ldap_authenticatable,
         :trackable, :validatable, :lockable
end
