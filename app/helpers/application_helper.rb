module ApplicationHelper
  def type_name(type)
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

  def validators_json(validators)
    data = {}
    validators.each do |validator|
      case validator
      when ActiveRecord::Validations::PresenceValidator
        data[:required] = true
      when ActiveRecord::Validations::LengthValidator
        if validator.options.has_key?(:maximum)
          data[:maxlength] = validator.options[:maximum]
        end
        if validator.options.has_key?(:minimum)
          data[:minlength] = validator.options[:minimum]
        end
      when ActiveModel::Validations::FormatValidator
        if validator.options.has_key?(:with)
          data[:pattern] = regexp_to_html5_pattern(validator.options[:with])
        end 
      else
        nil
      end
    end
    data
  end

  def regexp_to_html5_pattern(regexp)
    regexp.source.gsub(/\A\\A/, '').gsub(/\\z\z/, '')
  end
end
