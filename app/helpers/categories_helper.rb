module CategoriesHelper
  def model
    {
      name: Category.model_name.name,
      humanName: Category.model_name.human
    }
  end

  def attrs
    Category.attribute_names.map do |name|
      [
        name,
        {
          name: name,
          humanName: Category.human_attribute_name(name)
          type: type2name()
        }
      ]
    end.to_h
  end

  def attribute_type(name)
    case Category.attribute_types[name.to_s]
    when ActiveModle::Type::BigInteger
    when ActiveModle::Type::Boolean
      :boolean
    when
    else
      :other
    end
end
