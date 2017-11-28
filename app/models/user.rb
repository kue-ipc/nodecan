class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable, :recoverable,
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable, :lockable
end
