class OsProduct < ApplicationRecord
  belongs_to :os_family
  has_many :os_version, dependent: :destroy
end
