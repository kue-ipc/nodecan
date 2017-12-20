class CreateIpv6Pools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv6_pools do |t|
      t.references :ipv6_network, foreign_key: true
      t.integer :network_type, null: false, limit: 1, default: 0
      t.binary :first, null: false, limit: 16, deafult: "\0" * 16
      t.binary :last, null: false, limit: 16, deafult: "\0" * 16

      t.timestamps
    end
  end
end
