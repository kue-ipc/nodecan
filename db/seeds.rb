# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

def read_seeds_yaml_with_name(model)
  yaml_file = "#{Rails.root}/db/seeds/#{model.table_name}.yml"
  list = YAML.load_file(yaml_file)
  list.each do |data|
    data = data.map do |key, val|
      if key.end_with?('_by_name')
        key = key.sub(/_by_name$/, '')
        val = key.classify.constantize.find_by_name(val)
      end
      [key, val]
    end.to_h
    entry = model.find_by_name(data['name'])
    if entry
      entry.update(data)
      entry.save
    else
      model.create(data)
    end
  end
end

read_seeds_yaml_with_name(OsType)
read_seeds_yaml_with_name(Os)
# read_seeds_yaml(NodeModel)
