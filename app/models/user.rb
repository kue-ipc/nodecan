class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :database_authenticatable
  devise :ldap_authenticatable,
         :rememberable, :trackable, :validatable, :lockable
end
