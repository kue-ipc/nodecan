class OsFamily < ApplicationRecord
  has_many :os_product, dependent: :destroy
end
