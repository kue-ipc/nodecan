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

def read_seeds_yaml_os
  yaml_file = "#{Rails.root}/db/seeds/os.yml"
  data = YAML.load_file(yaml_file)
  data['families'].each do |family_data|
    family = OsFamily.find_or_create_by(name: family_data['name'])
    family.save
    puts "create or update os family: #{family.name}"
    family_data['products'].each do |product_data|
      product = OsProduct.find_or_create_by(name: product_data['name'])
      product.os_family = family
      product.require_security_software = product_data['require_security_software'] || false
      product.save
      puts "create or update os product: #{product.name}"
      product_data['os'].each do |os_data|
        os_data['name'] ||= [product.name, os_data['version']].select(&:itself).join(' ')
        os = Os.find_or_create_by(name: os_data['name'])
        os.os_product = product
        os.version = os_data['version'] if os_data['version']
        os.relesae = os_data['relesae'] if os_data['relesae']
        os.end_of_life = os_data['end_of_life'] if os_data['end_of_life']
        os.save
        puts "create or update os: #{os.name}"
      end
    end
  end
end

read_seeds_yaml_os
# read_seeds_yaml_with_name(OsType)
# read_seeds_yaml_with_name(Os)
# read_seeds_yaml(NodeModel)
