# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

def read_seeds_yaml(model)
  yaml_file = "#{Rails.root}/db/seeds/#{model.table_name}.yml"
  list = YAML.load_file(yaml_file)
  p list
  model.create(list)
end

read_seeds_yaml(NicType)
