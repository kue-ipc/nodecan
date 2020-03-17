class Category < ApplicationRecord
  has_many :operating_system
  has_many :hardware_type

  enum model: {
    hardware_type: 0,
    operating_system: 1,
  }

  validates :code, presence: true, uniqueness: true,
                   length: {maximum: 256},
                   format: {
                      with: /\A[a-z][0-9a-z]*\z/,
                      message: '英小文字から始まり、英小文字と数字のみでなければなりません。'
                   }
  validates :name, presence: true, uniqueness: {scope: :model}
  validates :model, presence: true
  validates :description, length: {maximum: 2048}


end
