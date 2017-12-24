# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

def setup_admin
  return if User.find_by_username('admin')
  admin = User.create(
    username: 'admin',
    display_name: '管理者',
    email: "admin@#{ENV['HOSTNAME']}",
    admin: true
  )
  admin.password = 'nodecan_admin'
  admin.save!
  puts 'create admin'
end

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
      entry.save!
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
    family.save!
    puts "create or update os family: #{family.name}"
    family_data['products'].each do |product_data|
      product = OsProduct.find_or_create_by(name: product_data['name'])
      product.os_family = family
      product.require_security_software = product_data['require_security_software'] || false
      product.save!
      puts "create or update os product: #{product.name}"
      product_data['versions'].each do |version_data|
        version_data['name'] ||= [product.name, version_data['version']].select(&:itself).join(' ')
        version = OsVersion.find_or_create_by(name: version_data['name'])
        version.os_product = product
        version.version = version_data['version'] if version_data['version']
        version.relesae = version_data['relesae'] if version_data['relesae']
        version.end_of_life = version_data['end_of_life'] if version_data['end_of_life']
        version.save!
        puts "create or update os version: #{version.name}"
      end
    end
  end
end

def setup_network
  Network.new({
    name: 'default',
    vlan: 1,
    use_auth: true,
    note: 'Default VLAN',
    ip_networks_attributes: [
      {
        network_type: 'static',
        address: '192.168.1.0/24',
        gateway: '192.168.1.254',
        ip_pools_attributes: [
          network_type: 'static',
          first: '192.168.1.1',
          last: '192.168.1.253',
        ]
      }
    ],
  }).save
  # reserved
  [
    {name: 'fddi-default', vlan: 1002},
    {name: 'token-ring-default', vlan: 1003},
    {name: 'fddinet-default', vlan: 1004},
    {name: 'trnet-default', vlan: 1005},
  ].each do |reserved_vlan|
    Network.new({
      name: reserved_vlan[:name],
      vlan: reserved_vlan[:vlan],
      use_auth: false,
      note: 'Reserved VLAN',
    }).save
  end
end

setup_network
setup_admin
read_seeds_yaml_os
# read_seeds_yaml_with_name(OsType)
# read_seeds_yaml_with_name(Os)
# read_seeds_yaml(NodeModel)
