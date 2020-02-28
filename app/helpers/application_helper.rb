module ApplicationHelper
  def type_json(type)
    case type
    when ActiveRecord::Type::Boolean
      :boolean
    when ActiveRecord::Type::Integer
      :integer
    when ActiveRecord::Type::BigInteger
      :bigint
    when ActiveRecord::Type::Float
      :float
    when ActiveRecord::Type::Decimal
      :decimal
    when ActiveRecord::Type::Date
      :date
    when ActiveRecord::Type::DateTime
      :datetime
    when ActiveRecord::Type::Time
      :time
    when ActiveRecord::Type::Text
      :text
    when ActiveRecord::Type::String
      :string
    when ActiveRecord::Type::Binary
      :binary
    when ActiveRecord::Enum::EnumType
      :enum
    else
      :other
    end
  end

end
