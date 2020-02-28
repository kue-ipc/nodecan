Category.attribute_names.each do |name|
  json.set! name do
    json.name name
    json.human Category.human_attribute_name(name)
    json.type type_json(Category.attribute_types[name])
  end
end
