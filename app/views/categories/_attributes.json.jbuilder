Category.attribute_names.each do |name|
  json.set! name do
    json.name name
    json.human Category.human_attribute_name(name)
    type = Category.attribute_types[name]
    json.type type_name(type)
    if type.is_a?(ActiveRecord::Enum::EnumType)
      json.set! :mapping do
        type.__send__(:mapping).each do |key, value|
          json.set! key do
            json.key key
            json.value value
            json.human t(key, scope: :enum)
          end
        end
      end
    end
  end
end
