class Category < ApplicationRecord
  enum model: {
    hardware_type: 0,
    operating_system: 1,
  }
end
